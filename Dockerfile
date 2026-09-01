FROM ghcr.io/ublue-os/bazzite-nvidia:latest

# Set custom metadata
LABEL name="custom-gaming-os"
LABEL description="Custom Gaming OS for Ryzen 5600 + RTX 2060"

# Copy installation script
COPY recipe.sh /tmp/recipe.sh
RUN chmod +x /tmp/recipe.sh && /tmp/recipe.sh && rm /tmp/recipe.sh
