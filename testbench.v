
module testbench;
reg clk;
reg rst;
reg vote_candidate_1;    //Push Button - 1 
reg vote_candidate_2;    //Push Button - 2
reg vote_candidate_3;    //Push Button - 3
reg switch_on_evm;   //Switch to turn on the EVM from IDLE and wait for the candidate
reg candidate_ready; //Switch to indicate the candidate is ready to vote
reg voting_session_done;
reg [1:0]display_results;    //Switches to display the vote count of all the 4 candidates
reg display_winner;  //Switch to display the winner
wire [1:0] candidate_name;
wire [6:0] results;
wire invalid_results;
wire voting_in_progress;  //LED indicating the candidate has entered the ballot and is yet to vote
wire voting_done;
 
evm dut(
    .clk(clk),
    .rst(rst),
    .vote_candidate_1(vote_candidate_1),
    .vote_candidate_2(vote_candidate_2),
    .vote_candidate_3(vote_candidate_3),
    .switch_on_evm(switch_on_evm),
    .candidate_ready(candidate_ready),
    .voting_session_done(voting_session_done),
    .display_results(display_results),
    .display_winner(display_winner),
    .candidate_name(candidate_name),
    .results(results),
    .invalid_results(invalid_results),
    .voting_in_progress(voting_in_progress),
    .voting_done(voting_done)
);
 
initial begin
    $monitor("Current State = %b, C1: %d, C2: %d, C3: %d", dut.current_state, dut.candidate_1_vote_count, dut.candidate_2_vote_count, dut.candidate_3_vote_count );
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
rst = 0; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 0; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#5;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 0; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0; 
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;

#10;
rst = 1; vote_candidate_1 = 1; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0; 
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 1; vote_candidate_3 = 1; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
//commented here
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 1; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 1; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 1; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 1; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;

#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 1; vote_candidate_3 = 0; 
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;

#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 1; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 1; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 1; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 1; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 0; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done = 1; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done =1; display_results = 2'b0; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done =1; display_results = 2'b01; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done =1; display_results = 2'b10; display_winner = 0;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 0;
switch_on_evm = 1; candidate_ready = 0; voting_session_done =1; display_results = 2'b0; display_winner = 1;
#10;
rst = 1; vote_candidate_1 = 0; vote_candidate_2 = 0; vote_candidate_3 = 0; //switch_off_evm = 1;
switch_on_evm = 0; candidate_ready = 0; voting_session_done =1; display_results = 2'b0; display_winner = 0;

#10;
#200;
$finish;
end
endmodule 
