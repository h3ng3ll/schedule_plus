using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Shared.Models.g
{
    /// <inheritdoc />
    public partial class _ : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Schedules_Groups_ProfessorId",
                table: "Schedules");

            migrationBuilder.AddForeignKey(
                name: "FK_Schedules_Professors_ProfessorId",
                table: "Schedules",
                column: "ProfessorId",
                principalTable: "Professors",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Schedules_Professors_ProfessorId",
                table: "Schedules");

            migrationBuilder.AddForeignKey(
                name: "FK_Schedules_Groups_ProfessorId",
                table: "Schedules",
                column: "ProfessorId",
                principalTable: "Groups",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
