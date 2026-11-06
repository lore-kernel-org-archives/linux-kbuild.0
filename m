Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793933722;
	b=KMk2mU09VhfBbQfZFp+ulKwxI+OO9WgXekcMpA1DjRHtbvY74/+7mfXuLB2Rh431xneH
	 RzhncRmEFMuYP47NUDHpnxZiUg3vMoS4S+BPQfwBbpmxqgEtTtcjpbWXvexWQUNcly3Sm
	 vk9M9IInqhaqN5Ay9CITlRTS3iPBaXKrnRP6Z7QnJqkBvoNPIEp6j1n7dAI73cNmWjCnH
	 1HHP4kOPrLGHm3nUeFZe99N+FI2gbKcdFJx5l1/mhmZWbckRzSaVnVfqXR2Xjmzo8Pm+G
	 VPuHdqZwh4FswXUPalaby4GAr2Mn5nrk7CsnQEi44hJZa1tan7qfbnE5SUkh5Wjfkqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793933722;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Aa623k5GdP97wZxrRXmZq7MSt77L3dovlNQ4YHJGW4U=;
	b=B08fZS3MU23u0wsOke9VV0dTYTgYUci1ubSdoqAdGhADAcZR9OBn2zFl3nnd1emSZf1F
	 q3425aVNVxOCNcaQrE0eSttXSK0uFmOWFjTgJ/pZXOIWVHWKy90KsNDinpXmfsOp6Ef7p
	 h8uNSBwQjfL9ykfLmvYiTMlKCs+PbSxwRe8rKXCCCH4VCoWIBP7czKcSx7EfuSGmLaCKX
	 fnNXsroCMZJA/FpazM5BAteFN/ZH/mKcqL8TYNl3yr2ZYBODNfCSNo/nEqPWIG0y+VzGt
	 BeiNyn4fUxEnGCmmnm3zNzN4wlgnC01//VU6l1Xsc2VtJ5NMn8zWjHwjFm7vyzEc2dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c/uZKnzm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD3606A326;
	Fri,  6 Nov 2026 02:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/uZKnzm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CFB1F0089F;
	Fri,  6 Nov 2026 02:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793933721;
	bh=Aa623k5GdP97wZxrRXmZq7MSt77L3dovlNQ4YHJGW4U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=c/uZKnzmjcGQ/2uu3XIfEZMoV5lSjnpUuul1cGbMOKVY8VJ2da9qlOFG/AbyHcwHa
	 R48e2QSNVkJCAKxh2UIFUn+JLW01qWE5r6i8z9brApi5F7LeaRFHEdHh1zmRHJCIO2
	 nzkMlU7Eo/PABvzJlJ0RMG6iSBeMKspvlcG+gAuEmXcps9bgh5t2JFJlxD2cVE8ewc
	 to/gPsUhiyyjqJ5BO5qptPJTaC0hYX4tNWLIawoNdgsM7dFwYERT6vZ/YUVwH7CStA
	 CYVAmUfjD7pyOLJ//0a1/5+6hTVn1salitH8TdJsBt6dH6yNQkwcuiOe6u7hWpJTX+
	 ZxbfXRK8WAohA==
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
Subject: Re: [PATCH 0/3] kbuild: don't print DESCEND messages from tools/
 build
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
References: <20261102-kbuild-descend-spam-v1-0-caff4f840cb7@weissschuh.net>
Date: Thu, 05 Nov 2026 19:55:14 -0700
Message-Id: <179393371497.309869.7266157906388601191.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=nathan@kernel.org;
 h=from:subject:message-id; bh=33CzRX2B7A2uXa1VDAqJC8APe1NE6dmkDCYCieD0Vj8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlvHafkfHp/pS/Pv7Dd4ujqlzXvz4hUTXtYsuLSxiVO1
 8/M1rGW6ShlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATidvC8Iev8YO4YuP8tzOk
 VhR82aFkqLXMI1c8IyBzWbDCMsmIuFCG/3XTGbNZqxRMKm6eKN6hnnqiP+iNwH/187Kd36Rz1hl
 zsQEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> kbuild itself does not print the directories it descends into, the
> tools/ build however does so. When kbuild executes the tools/ build
> these messages are out of place.
> 
> Forward kbuild's behavior to the tools/ build:
> Nothing is printed by default, the full command is printed with V=1.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
> Thomas Weißschuh (3):
>       tools/build: Deduplicate the descend commands
>       kbuild: drop the tools/ target
>       kbuild: don't print DESCEND messages from tools/ build

Seems reasonable. The Sashiko comment on patch three seems relevant?

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

