using System.ComponentModel.DataAnnotations;

public class Noticia
{
    public int Id { get; set; }
    [Required]
    public string Titulo { get; set; } = string.Empty;
    [Required]
    public string Contenido { get; set; } = string.Empty;
    public string? Tipo { get; set; } = string.Empty;
    public DateTime Fecha { get; set; }
}