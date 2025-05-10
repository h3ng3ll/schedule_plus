using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Shared.Models.g
{
    /// <inheritdoc />
    public partial class CourseUserrefactoronProfessor : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Courses_Users_ProfessorId",
                table: "Courses");

            migrationBuilder.AddForeignKey(
                name: "FK_Courses_Professors_ProfessorId",
                table: "Courses",
                column: "ProfessorId",
                principalTable: "Professors",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Courses_Professors_ProfessorId",
                table: "Courses");

            migrationBuilder.AddForeignKey(
                name: "FK_Courses_Users_ProfessorId",
                table: "Courses",
                column: "ProfessorId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
