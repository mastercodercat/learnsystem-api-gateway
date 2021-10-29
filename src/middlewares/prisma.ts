import { Prisma } from "@prisma/client";
import { hashPasswordSync } from "../utils/password";

export const hashPasswordMiddleware = async (params, next) => {
  if (params.model === Prisma.ModelName.v2_users) {
    if (params.action === "create") {
      params.args.data.password = hashPasswordSync(params.args.data.password);
    } else if (params.action === "createMany") {
      params.args.data = params.args.data.map((user) => ({
        ...user,
        password: hashPasswordSync(user.password),
      }));
    }
  }
  return next(params);
};

export const softDeleteMiddleware = async (params, next) => {
  if (params.model === Prisma.ModelName.v2_users) {
    switch (params.action) {
      case "delete":
        params.action = "update";
        params.args["data"] = { deleted_at: new Date() };
        break;

      case "deleteMany":
        params.action = "updateMany";
        if (!params.args.data) {
          params.args.data["deleted_at"] = new Date();
        } else {
          params.args["data"] = { deleted_at: new Date() };
        }
        break;

      case "findFirst":
        params.args.where.deleted_at = null;
        break;

      case "findUnique":
        params.args.action = "findFirst";
        params.args.where["deleted_at"] = null;
        break;

      case "findMany":
        if (!params.args.where) {
          if (!params.args.where.deleted_at) {
            params.args.where["deleted_at"] = null;
          }
        } else {
          params.args["where"] = { deleted_at: null };
        }
        break;

      case "update":
        params.action = "updateMany";
        params.args.where["deleted_at"] = null;
        break;

      case "updateMany":
        if (!params.args.where) {
          params.args.where["deleted_at"] = null;
        } else {
          params.args["where"] = { deleted_at: null };
        }
        break;

      default:
        break;
    }
  }
  return next(params);
};
