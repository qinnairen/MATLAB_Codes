function s = plot_complex(c)
    real_part = real(c);
    complex_part = imag(c);
    plot(real_part, complex_part, 'o')
    xlim([0, 10]);
    ylim([0, 10]);
    xlabel("Real Axis");
    ylabel("Imaginary Axis")
    hold on ; 
    quiver(0,0, real_part, complex_part, 'off') 
    hold off; 
end
