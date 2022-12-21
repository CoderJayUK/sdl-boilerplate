SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin

EXE := $(BIN_DIR)/game
SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

SDL_DIR := lib/SDL
SDL_BUILD_DIR := $(SDL_DIR)/build
SDL_LIB := $(SDL_BUILD_DIR)/libSDL3.so 
SDL_SRC := $(SDL_BUILD_DIR)/src
SDL_INC := $(SDL_DIR)/include

CPPFLAGS := -Iinclude -I$(SDL_INC) -MMD -MP
CFLAGS := -Wall
LDFLAGS := -Llib -L$(SDL_LIB)
LDLIBS := -lm

.PHONY: all clean

all: $(EXE)

$(EXE): $(OBJ) | $(BIN_DIR)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

clean:
	@$(RM) -rv $(BIN_DIR) $(OBJ_DIR)

-include $(OBJ:.o=.d)
