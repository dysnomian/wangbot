describe Wangbot do

  puts subject

  describe ".load" do
    it "loads its board credentials from the config YAML" do
      expect(wangbot.server).to   eq(server)
      expect(wangbot.nick).to     eq(nick)
      expect(wangbot.channels).to eq(channels)
    end
  end

  describe ".log_on" do
    it "logs on to the appropriate board"
  end

  describe 
end
