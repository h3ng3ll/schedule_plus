namespace server_api.Utils.Extensions;

public static class DateTimeExtensions
{
    public static DateTime StartOfWeek(
        this DateTime dt,
        DayOfWeek startOfWeek = DayOfWeek.Monday
    )
    {
        int diff = (7 + (dt.DayOfWeek - startOfWeek)) % 7;
        return dt.Date.AddDays(
            -1 * diff
        );
    }

    public static DateTime EndOfWeek(
        this DateTime dt,
        DayOfWeek startOfWeek = DayOfWeek.Monday
    )
    {
        return dt.StartOfWeek(
            startOfWeek
        ).AddDays(
            7
        ).AddTicks(
            -1
        );
    }
}