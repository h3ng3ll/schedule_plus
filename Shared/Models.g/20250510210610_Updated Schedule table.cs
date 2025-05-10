using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Shared.Models.g
{
    /// <inheritdoc />
    public partial class UpdatedScheduletable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Courses_Professors_ProfessorId",
                table: "Courses");

            migrationBuilder.DropIndex(
                name: "IX_Courses_ProfessorId",
                table: "Courses");

            migrationBuilder.DropColumn(
                name: "ProfessorId",
                table: "Courses");

            migrationBuilder.AddColumn<int>(
                name: "ProfessorId",
                table: "Schedules",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Schedules_ProfessorId",
                table: "Schedules",
                column: "ProfessorId");

            migrationBuilder.AddForeignKey(
                name: "FK_Schedules_Groups_ProfessorId",
                table: "Schedules",
                column: "ProfessorId",
                principalTable: "Groups",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Schedules_Groups_ProfessorId",
                table: "Schedules");

            migrationBuilder.DropIndex(
                name: "IX_Schedules_ProfessorId",
                table: "Schedules");

            migrationBuilder.DropColumn(
                name: "ProfessorId",
                table: "Schedules");

            migrationBuilder.AddColumn<int>(
                name: "ProfessorId",
                table: "Courses",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Courses_ProfessorId",
                table: "Courses",
                column: "ProfessorId");

            migrationBuilder.AddForeignKey(
                name: "FK_Courses_Professors_ProfessorId",
                table: "Courses",
                column: "ProfessorId",
                principalTable: "Professors",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
