Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794759609;
	b=lQ9Y87eSGf7mtEqCRoLOV2Z1xOwoQrtFpdmn/udn/wRwJJNmQLlw1PuhcawNtqnJHtDM
	 GuV5mHfUhBYF9sbm4YHVH/6N7Z5sHfNxPia1iDyzSe+pMuQscNu9qBpHuNYTvdWJBhjwV
	 dyJNQUP6C/b0v9Cq454G9BKqZNYsvW0+dpmFyOJH7epF1ZUzSKDDPFFRU6hbutA8JT4Oh
	 TuXufjv9PG7KSX/gIB/Nym7/iqT380LZvYIk/NYVBcBlHCzftgRBKWIenUKvIHtA2fUEz
	 t737+zDmeKmg+F2cmFmiOpMVpL7UBwKaW+81GHQCNvWtN7MhiBtD3zE+/3lGdSk+5Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794759609;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-USESPAMBG:Date:From:To:X-OQ-MSGID:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MjBgBplRr4kC7I4DyPZVgci96cpt2t5IkgFFB7YSODQ=;
	b=b/HajnA/sE0xKqtS3qCFz6KCoMjymb7uoyFdeKJIpbbgh3E+U5K8afUOp2T9IJDcuf0C
	 XsE7iDB/wJvybkoq5YTocC72jcCrxxqVzag+GxrM8Vn4/N7Ow9bmgIV2wJewREn5LwtHH
	 esrfJgk4HV6VbcFyv9iJDLLLbNSh7NFN19OSNEPSowmn8HhsYW1cghOQ7IUXzY3Xcs9sh
	 za/LVQQ3AcW1JeG17fWwTvHj0slPkxxDygHp1qZKvoxSEsJt8nKJLQTgvETZkNnWxsnO6
	 tM3smhR2ppKdL1PJe6FaCVR7jC2QVxar0LN0IUVOQpk1uecwP+8Y7b/V4QAkr7r572w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=rT9bVxZO;
	arc=none smtp.remote-ip=162.62.58.69
Received: from out162-62-58-69.mail.qq.com (out162-62-58-69.mail.qq.com [162.62.58.69])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1FF606A31D
	for <linux-kbuild@vger.kernel.org>; Sun, 15 Nov 2026 16:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C1FF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=rT9bVxZO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794759597; bh=MjBgBplRr4kC7I4DyPZVgci96cpt2t5IkgFFB7YSODQ=;
	h=Date:From:To:Subject;
	b=rT9bVxZOvkJNXvzrRTepkPAG/ifce1F3rPTexmQ0O30MYd2zMrKrrJWrGSAZ7uuHy
	 O5cuiQ0lE70hXAVnR1T/CpDMGWyC7di8azzr3W+ovzlIyvt5PCk1C9BpBsrmxATO1N
	 ICaoXXlAwwoEoY8llQBUOTvRv2HjRMtMDgjqO0lY=
Received: from 9efdd1545612 ([182.46.50.221])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 4F7B1A2F; Mon, 16 Nov 2026 00:19:55 +0800
X-QQ-mid: xmsmtpt1794759595taq3djhfs
Message-ID: <tencent_34D400F628673340400F594D2888CF9B4506@qq.com>
X-QQ-XMAILINFO: OeJ9zRfntlNPNULuGX0r/C60AgxdNOxgBXZWI02MeJx80Vs/ofmf3FxTpZ4AAW
	 HVmROdEm2bubi955p6cQVjUrGbyuoi6PQI+r732feCJ3pWfLByKK0uIteGHHQRaGfB37wFcicE8v
	 btbgBZi7oFsKhKmKOACNxEd4y0M/FJBF3iEc8WigDud8vp0qZpu1cfaoM1s5ERq9+TeGOkVfJp2x
	 F1gFSmCPIBiu9i52521fgB0z97gI9PeFOtAM1wbNcdD0PUhRURJSTgEvZm8RJIWmN7hknodqD5p9
	 xEIXjuBc7GqLvk33CcoW8RuNZ4SBopn6NP4cAwncPNddsN7JF7MSYzNQgJOHmQBUBgXJ6MS++yrW
	 R1vKj8huaT0hF+K6ThdUD88YBb7tRdv8CqSqiRRAMcSw4Lt4Le4LtUQcaHGQLsNazn5J7wQr9WlV
	 eT057Wq0kNWO1gpduesX5vy6PMddtYGAjAqYwiCiuMnvfE6UmqAsdeCsPawdAoT2HIYqhooM2fyp
	 u2c0vsYj4ASk6QZlR+y27XJftOOFSCnOh85TwL3v/3vKoTe8TazGVSKTxI7r6/cbM9zaJh4jTNkT
	 25xmbchL53erx2YR0B4vDbPnaneoTHgYhUWjAFV69jcjvVp9Me+yITfv2ZKAvt6xs215a2C7gwLO
	 wXdRDOHqpiRENo8KqVc2CfQU8cKR7tBQo/ltwA95pNKBWmgD0Nzem1o3Z8aMlvHHE7889IBlgmIe
	 J/+uTpqKwz9GT5vsvn5/1bz84ngRqX4B11E4dxuFZTuuZu5KyU8H/BFbxPQE/piTeEyM4wuUDl26
	 XvWbQ72gMUgp+KeMxkj0KtBtm2XHqlU3yNdHzPglCzrKDdJSTUlgleqBrkUhdF9jaflx+MTR4lUS
	 Wizuhk9rZIhLemQmpmxNMrmTzXzy1cVbGzLGUGStT73J5a6aTkaduZzoZfvuD+yZTyTqaxgEW0Nh
	 89sQ3oVQlVZU2kTYaQpFHSMRiKUqcrA9OlTZCTI+Xu3Qd7hQaT2a0M0QYyXSE6z4Rd39Y9YT1B/o
	 IjSqx9zshMFrApciFNFlKdxKuXE/3A/lCJJRnkFluv50aBdSEtNxq9uLJsrlI=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-USESPAMBG: true
Date: Mon, 16 Nov 2026 00:19:55 +0800 (CST)
From: 3777826965@qq.com
To: linux-kbuild@vger.kernel.org
X-OQ-MSGID: <859029913.464.1794759595681@9efdd1545612>
Subject: Confirmation of technical collaboration suitability for the
 CryptoMiniSat project
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello, I saw that SUSE is kernelnewbies.org Maintain the CryptoMiniSat project, which involves the construction and maintenance of complex software systems, and has high requirements for development efficiency and collaboration stability.

 We are Weifang Leiming Cloud Network Technology Co., Ltd., focusing on software development and AI-driven automated operation and maintenance. The company won the second prize in the Xingzhi Cup National Artificial Intelligence Competition in 2025. Relying on the self-developed CodePanel AI development tool chain, the company has realized full-process automated development - a task that originally took a day manually can now be completed in an average of 30 minutes. Currently we are in Weifang, Shandong, where the overall development cost is more advantageous.

 Considering that projects like CryptoMiniSat often face periodic manpower pressure, we are exploring the establishment of a flexible technical collaboration model with external teams, such as undertaking some module development or continuous operation and maintenance work during the peak development period. I wonder if you currently have any need for temporary resource replenishment on related development tasks?

