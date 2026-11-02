Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598964;
	b=2tBUhz5CfeQYAFby7WfjZcpfmtnUDOThFHZdvB2yaltXqyW9ZewxQF/29Ci8KrdXFZbU
	 P3wkYt5HNjNky43JlIbnqJEVXfLWjzl7pfD4nzfuzfTLMu/DMQcyMZrq8V4yVu9s2Nyvv
	 Y91z/X0WdkDt4YHifNbF4BqLFzSLXFjeU2WjDcHWreIx8Ju1bHwvGnSTVUYXjdzXJQa2H
	 yb7TsDAABkVpmBELl+rhbLV0E8hAmV7Fmvnnxi0j4bE+cCQFYYMe/QUisP+RvhfB+6I5l
	 ztkVErUDBZg1vHu+z4IsIGHCMlCBx4pM3DukhKI5NL9b9hDi8kBTX6mWaDi+NqVhp0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598964;
	h=DMARC-Filter:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6Y1Y+O5kq88tjUCuMA+ieDSab1ccmXhG0I3B4UawGVw=;
	b=eyO7FObm49YrjPY5JMLaaxcrQq8kQqSz4JAa7fP4TIzw4nyMK+mWTiERSDZFr+2zyhEU
	 7Is4AhtN7FjkT9FJCIXyvbVPj2X4aip1MmBBgbfP7vUiqPv+7LV0tXnArUfjuS9ESjwFo
	 cbrmusrMC0YW5ZB+X6t5QQU3LeU0evgqfMNdWMbDdYhaGVW6iZlxGp8LFqrHeQW+cv18Y
	 jnpbPh+K+WTtXVyvOW8bEa7dOSo8rB1HSbbEDpYj/p5xif1/hEL0Z/XXGeIQBEFzJe5xZ
	 FGqa/5ABw2q6Kt/RPCChpy3K6v/587HPT7c2OaGDNVQ7ui3PU9eLN1QYY7Iq5RLpuTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b="YHHBv/ji";
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ADD60A260E;
	Mon,  2 Nov 2026 05:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20ADD60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=YHHBv/ji
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793598962;
	bh=vVoF722LJ5fA3KYp+P1Y4Z0Icr2joyJfX+6GZOP4pLM=;
	h=From:Subject:Date:To:Cc:From;
	b=YHHBv/jie2WXhd+OlD9WhgQJBSFxQeqs4vVOh3tw1aqIGRBDgdR8XHgAPxwIDK782
	 T5p7u9LbiTXN7GrCzqTAVVSbINHFy2kW1uxA3soyPIf8i9KpWrmIuhc4xaq5kgXnwm
	 BgXsVrU5AqaYxftUvwUBPhacbIVYJ3faCFZH8fF4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] kbuild: don't print DESCEND messages from tools/ build
Date: Mon, 02 Nov 2026 03:14:15 +0000
Message-Id: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTtJ20QEr2JctJ0pjD+VdMSYE
 O5OleW3eG8B5SKscG4WKPwRlVeusIcG4ujzwChUDc641hrX4z3M8iAk1siZUCf/xBSM9ZRO3Hd
 HqOVUOMn3f71cd+scbhzfvxWs6wY8MLUqdwAAAA==
X-Change-ID: 20261029-kbuild-descend-spam-fb01adf7e985
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793589258; l=854;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vVoF722LJ5fA3KYp+P1Y4Z0Icr2joyJfX+6GZOP4pLM=;
 b=SyPdc3dALh/U0YL0TlZISDQvsBNu2BBnt6SWx8XcM41JFuXlqrfiSsEOLtsZW13dBfNvO3UM2
 f6oOPU5bPC2AyYzLCnYqvdPGOuegyBrnBGn+EnFpGFFs+DPA8gLAVnn
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

kbuild itself does not print the directories it descends into, the
tools/ build however does so. When kbuild executes the tools/ build
these messages are out of place.

Forward kbuild's behavior to the tools/ build:
Nothing is printed by default, the full command is printed with V=1.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (3):
      tools/build: Deduplicate the descend commands
      kbuild: drop the tools/ target
      kbuild: don't print DESCEND messages from tools/ build

 Makefile                       | 6 +-----
 tools/scripts/Makefile.include | 7 ++-----
 2 files changed, 3 insertions(+), 10 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261029-kbuild-descend-spam-fb01adf7e985

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

