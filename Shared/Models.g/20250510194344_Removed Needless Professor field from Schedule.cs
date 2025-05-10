using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Shared.Models.g
{
    /// <inheritdoc />
    public partial class RemovedNeedlessProfessorfieldfromSchedule : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Schedules_Professors_ProfessorId",
                table: "Schedules");

            migrationBuilder.DropIndex(
                name: "IX_Schedules_ProfessorId",
                table: "Schedules");

            migrationBuilder.DropColumn(
                name: "ProfessorId",
                table: "Schedules");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
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
                name: "FK_Schedules_Professors_ProfessorId",
                table: "Schedules",
                column: "ProfessorId",
                principalTable: "Professors",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
