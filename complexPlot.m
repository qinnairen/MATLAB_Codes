function s = plot_complex(c)
    real_part = real(c);
    complex_part = imag(c);
    plot(real_part, imag_part, "o")
    xlim([0, real_part +1]);
    ylim([0, complex_part +1]);
    xlabel("Real Axis");
    ylabel("Imaginary Axis")
end
