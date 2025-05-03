using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Scaffolding.Internal;
using Shared.Models.g;

namespace Shared.Context;

public partial class MyDbContext : DbContext
{
    public MyDbContext()
    {
    }

    public MyDbContext(DbContextOptions<MyDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Course> Courses { get; set; }

    public virtual DbSet<Department> Departments { get; set; }

    public virtual DbSet<EfmigrationsHistory> EfmigrationsHistories { get; set; }

    public virtual DbSet<Schedule> Schedules { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySql("server=192.168.0.80;database=schedule_plus;user=dotnet;password=dotnet", Microsoft.EntityFrameworkCore.ServerVersion.Parse("10.5.25-mariadb"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_general_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<Course>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.HasIndex(e => e.DepartmentId, "IX_Courses_DepartmentId");

            entity.HasIndex(e => e.ProfessorId, "IX_Courses_ProfessorId");

            entity.Property(e => e.Id).HasColumnType("int(11)");
            entity.Property(e => e.DepartmentId).HasColumnType("int(11)");
            entity.Property(e => e.Name).HasMaxLength(255);
            entity.Property(e => e.ProfessorId).HasColumnType("int(11)");

            entity.HasOne(d => d.Department).WithMany(p => p.Courses).HasForeignKey(d => d.DepartmentId);

            entity.HasOne(d => d.Professor).WithMany(p => p.Courses).HasForeignKey(d => d.ProfessorId);
        });

        modelBuilder.Entity<Department>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.Property(e => e.Id).HasColumnType("int(11)");
        });

        modelBuilder.Entity<EfmigrationsHistory>(entity =>
        {
            entity.HasKey(e => e.MigrationId).HasName("PRIMARY");

            entity.ToTable("__EFMigrationsHistory");

            entity.Property(e => e.MigrationId).HasMaxLength(150);
            entity.Property(e => e.ProductVersion).HasMaxLength(32);
        });

        modelBuilder.Entity<Schedule>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.HasIndex(e => e.CourseId, "IX_Schedules_CourseId");

            entity.HasIndex(e => e.ProfessorId, "IX_Schedules_ProfessorId");

            entity.Property(e => e.Id).HasColumnType("int(11)");
            entity.Property(e => e.CourseId).HasColumnType("int(11)");
            entity.Property(e => e.Day).HasColumnType("int(11)");
            entity.Property(e => e.EndTime).HasColumnType("bigint(20)");
            entity.Property(e => e.ProfessorId).HasColumnType("int(11)");
            entity.Property(e => e.StartTime).HasColumnType("bigint(20)");

            entity.HasOne(d => d.Course).WithMany(p => p.Schedules).HasForeignKey(d => d.CourseId);

            entity.HasOne(d => d.Professor).WithMany(p => p.Schedules).HasForeignKey(d => d.ProfessorId);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");

            entity.Property(e => e.Id).HasColumnType("int(11)");
            entity.Property(e => e.Email).HasMaxLength(255);
            entity.Property(e => e.Name).HasMaxLength(255);
            entity.Property(e => e.Role).HasColumnType("int(11)");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
