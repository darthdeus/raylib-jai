#import,file "../module.jai";

#import "Basic";

main :: () {
    window_title := to_c_string("raylib [core] example - basic window [Jai]");
    InitWindow(800, 400, window_title);
    SetTargetFPS(60);
    window_text := to_c_string("Congrats! You created your first window!");
    while !WindowShouldClose() {
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText(window_text, 190, 200, 20, LIGHTGRAY);
        EndDrawing();
    }
    CloseWindow();
}
