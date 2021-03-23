using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Koop.Migrations
{
    public partial class snap2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_funds_FundId",
                table: "AspNetUsers");

            migrationBuilder.AlterColumn<Guid>(
                name: "FundId",
                table: "AspNetUsers",
                type: "uuid",
                nullable: true,
                oldClrType: typeof(Guid),
                oldType: "uuid");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_funds_FundId",
                table: "AspNetUsers",
                column: "FundId",
                principalTable: "funds",
                principalColumn: "fund_id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_funds_FundId",
                table: "AspNetUsers");

            migrationBuilder.AlterColumn<Guid>(
                name: "FundId",
                table: "AspNetUsers",
                type: "uuid",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"),
                oldClrType: typeof(Guid),
                oldType: "uuid",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_funds_FundId",
                table: "AspNetUsers",
                column: "FundId",
                principalTable: "funds",
                principalColumn: "fund_id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
