Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058755;
	b=gvsSWBbXv9Ea5i5YrfZHw7myoVM6Owpy7qQjMm2OQ1i/P9rpo3cL3yE+osqn4mP7idC4
	 SZfvk2vntnL4a2Sdn4PhVulMt+VTuNuHsNBIltLuHhedMV/gRqO583UwHpS8pw6ByLTb8
	 a1r3u//bpu5otnnQAni6kbZ8HrtqAO7ESBZx8sM0wMdAuVLVg6MyJWxC2DJv++WAPsbUm
	 HZWNY90+usWJKJE8KQlXZsA0AUoNpcES2PKKO0OWbbsICqI0A6hDXLxBqvUVexGLqZqyP
	 XO7qTh26jFjKxCZOw418jeoHMMaFOD4Sb0TJhbs0oV7H/sDfrSkjCSzMKM30X/cqxqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058755;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4es2IsCQPonbHHAQ/6wK0aeBm5W5dYmKZ3AtzLiTk+o=;
	b=TgedQTfSH+IymxLEBGDt+QXk0ZyheRStWR97LiexHDoirpEX632o4aSwO0e7EAqGd0ad
	 J4IWKgudS2gXAAxPao+OVNlc0Rfhy8vQDpjPd/HU2vYwmVDCAlnKT/lqd6Z4BEPDXYRq6
	 xem06Dh8RI6D80vVuvcJGMWIR42MLTRfInpLJEWUVa3p649g44boFttfbRT2JZvvda0SD
	 eTHZCszFAKd/aQ+uOLCQVBOjzTX7Q12GeEy6kjeDmH2JBaztdCpH7wnkZa9TRTAyL8pux
	 x98H6ZQeo/HI4km5XRCwfQM4GZMSFuos2URvZPyyJPBIOjlqYKLD/DTSbIdvTgSzlMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+GgHmVi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 75B0C606D80A;
	Sat,  7 Nov 2026 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+GgHmVi
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8B2551F008A7;
	Sat,  7 Nov 2026 13:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794058755;
	bh=4es2IsCQPonbHHAQ/6wK0aeBm5W5dYmKZ3AtzLiTk+o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=i+GgHmVikWs41jZ6spAYkPpKUH36jcXDnfkqC+t1av7XMB1xGhjO9eSh/Kgjh1mV+
	 rJNNM6XCg4+ynh7xbQSgmFDtQiwwdc2i/DyC8IMjYiE0aldf5lVRKhbwUf8RIfcgdb
	 phbkWZF7TsHFqni9BEG8JenfHeAAXs1zCBrqKyMRVFVrL7/SKL8syx4Jm6qltJDvM3
	 2J3GFX2M/8mA3AubAUVJoVeDdPfeaVaT9tOoRtghAI+KXvDZra1RMhXSoPjbQOVYei
	 lso1kd3Z0sMZKwBEQVmj9SnGbXq3aDifvgT4eKGUB7KhT2fTxvt4H9jpBHzfDdfbUu
	 3UNmGP8ARiCNQ==
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
Subject: Re: [PATCH v2 0/3] kbuild: don't print DESCEND messages from
 tools/ build
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
References: <20261107-kbuild-descend-spam-v2-0-3bb0a7c4781c@weissschuh.net>
Date: Sat, 07 Nov 2026 14:38:03 +0100
Message-Id: <179405868303.60865.9461804119640294826.b4-review@b4>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=885; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=mTRT05V0WKqTklSHcD3uM4+lnv/RjbeOoolXVRLRnt0=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBq7ym9cQDMTrTbGZjz77WavsaZy59/ePKE80WaS
 hhTDJfTekWJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCau8pvQAKCRAHUgpwFiYS
 aQd2EADUECPYd57j+3u7+Yq1x62uO6b5YEufEoT/lHI+KaoDT4ixyk2DFHd2EHMcetK9i+xx/31
 AMluDnMA9UQPbUxL3Todz5HL53scUL/amZNQ7NFEaLVlqkDEfHzpCG8ai8KpmYGev/oLKXFayh3
 hWaIBhPgGvyJeK9wbRSMmIipkdjncdwwRd1agYCTL2OAAbEcYsiAHsbx62hCapURcF/14DdKAq5
 pELyQ329TXyaeGfGEqT/rNaV9sdOnzMicKTVuQbaM8aQW+3uxuyzwWmgwE5xCxWeNGNQCqGD1om
 WSHb3x+dJtBerxuL1Y/muaBDo3PIVntNhQzoAtrue1IUPyIzmBAl6DAldzBQK1iWNUUNXK+89UH
 Guj+88ZoBWME9MbCzn+FerYyobtAvtKfajm2RoPmeTL0h+oVdb1s7dX7jIrpgQdf38+imQ9zGQA
 YzAXrFjwT9dqr+gu9yXArOBLRk14+GjYeDnJnlI6rZGSygh/r7wJGkoewuKsADSJUQIh285HAGQ
 AkMGmdpYKzin+PPxujcDAfKsTBkgNDHrqpcSGXyEdJnANmNzsHSjD0fS2p1xF/ZOv8I7l3UtAyc
 kON8NS9ZSleMI5TCduIG0v26Uf/9KB4OOQqKnDg8rMQB1PAv9qwK0xD8+ZxFw9LgiBaWkZAGRXr
 nA79ocjwZ2jdtIA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> kbuild itself does not print the directories it descends into, the
> tools/ build however does so. When kbuild executes the tools/ build
> these messages are out of place.
> 
> Forward kbuild's behavior to the tools/ build:
> Nothing is printed by default, the full command is printed with V=1.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Pick up tags from Nathan.
> - Move override logic to the tools/ build.
> - Reorder the patches.
> - Link to v1: https://patch.msgid.link/20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net
> 
> ---
> Thomas Weißschuh (3):
>       kbuild: drop the tools/ target
>       tools/build: Deduplicate the descend commands
>       tools/build: Don't print DESCEND messages when executed through kbuild

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

