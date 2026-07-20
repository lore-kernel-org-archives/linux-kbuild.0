Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D573932DC;
	Mon, 20 Jul 2026 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784574713; cv=none; b=HmvBQwzUiXH6pKwg2TLzGyiONpqCIFrP0n8adGElNGl741Iv/BXIOm5ZR0s7rbxLoccrwGC6dfFmXfiKA7/CvUq4EtsqoKKWy/80MiLlVLI0gr3eGsZIu5cbcj92qO+BR92Ey9t7hoG3GtHWNOnepug6/HFxACcqhsUFsWwIE4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784574713; c=relaxed/simple;
	bh=V2jH/3ucufi2sgMOkTaK3yFt9adeBuWwWKPFTIo4YQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GSgH9lFBLWFQlo5St4IvfTrKM9wMFKb1H+wyuAlWnl+r6QW3NXHHTYSlReYUf/ktwfiZVumhMnuJIc3yX64TlmLxW3hZyYBOUSx+rBsKqNfulV1F+Msuc8NwOvFFGjPIJNQg18z7mbLcJ3v9RBHiWJe5a1rd6G4REjsVIOT/WjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adTd1WZy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adTd1WZy"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3A3CC1F000E9;
	Mon, 20 Jul 2026 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784574711;
	bh=nHK5C235HwqUtd7Y6g2KjSjFdG4Ox+bbjFz7ZztaCsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=adTd1WZy0hIZJXwhLyh50bOc1vNpLyVrfZAz3ZwwM8zcsCN8KlfqT8slDEsx3BetP
	 RU/TgkfLPXE8NDlgoLXG+4A7SUN+CHNfSfMbXmz38r9ut4A6uLjrBMsC3HxisiN2i/
	 Qr2E30sV/PBK2AshyM4xPGFha1YswN+JyPUYqfEzIngH4+OFnFaBesUFKLlHzvruTE
	 jPKTDYz2FRd05oPkzikDeBvxAB0PgP7O0PnpEyi9UcCNE/pJozSuQuK12Ll4HC5OYa
	 6M0mNPNZ6aw87hvPWBRxuRhZ9+C9sBxXeEJNUMKIjK4dq+khcgcF1YFaOB7kM+sq2u
	 AliB7U8iYylPA==
From: Nicolas Schier <nsc@kernel.org>
Date: Mon, 20 Jul 2026 21:10:31 +0200
Subject: [PATCH v2 1/2] kbuild: Mark usr_gen_init_cpio as
 no-dot-config-target
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-move-gen_init_cpio-to-scripts-v2-1-26b7e15c7133@kernel.org>
References: <20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org>
In-Reply-To: <20260720-move-gen_init_cpio-to-scripts-v2-0-26b7e15c7133@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Askar Safin <safinaskar@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=V2jH/3ucufi2sgMOkTaK3yFt9adeBuWwWKPFTIo4YQ8=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqXnKsh9dLla535THmLfGjV3ggGsAEhgovoKr7w
 x7LeZwQUD2JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal5yrAAKCRAHUgpwFiYS
 aWJvEADA/VHefcqNz8bPmK5yu1kzcBXk4RwT7Oyvp8t3VhjtRV074hpxN0ijpCErDM8Zl5hl/Gv
 ZhwU95bQytqK/0NDkfPg9ezjxiFcEP2HIQe2kUQExCmdwdrad3RxAbHBwKZxioBv6Y/6yJhQVG9
 zu1Bkk34Q5C+JI78dP0cCuWr8YR4QqrN6JUbU+BpSRgzaoEl3tK2+YdZkVJ9I96u/rmheeexxNw
 Jqai31h160mwmwNvqCXJtf+y7jGe6F7BVgYUj2/tZX64AjlA1Ss5A13itxQ0YGlRzSVGnJspSaf
 hCPFf87oa7xRnHHGMDhd1VjEnYGu84IhjX6S8yUVAic7pwfBkr6nnUnKQNj/rrub/ITcLk4J411
 Co2rLIsnU5f0hM3N1k8oMcSqBYX2gK3ajY1XEFYinqUBuIsQ2JOHrJsBkDHLafPUGF420qI5dQQ
 b52j5y/Xm6BAzw7RVI11MOi0rJTnd8nU7OF8mL5GFlPOl/vpiq/Db5QjS4LPtlI3urGbBQlXT+w
 k0d0t5hnEqjPL1OTVMQy/zn15uW0l6e/tDXYPpvCmsVWMtdneBET2INfAwOUABBaZxoLmlWS8gm
 WzjAKRvkDi/IPa6EhjObLUvM8TSiy4OD02MfWxxBwMW7jl9iLZkJzXN08yGiWA7FPiT21mZ+fsI
 R+P/UP4s6e74fNQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

Let usr/gen_init_cpio be built also if there is no kernel configuration.

Askar Safin reported that gen_init_cpio may be of use before any kernel
configuration is available.  Add usr_gen_init_cpio to list of targets
that do not require a .config file.

Reported-by: Askar Safin <safinaskar@gmail.com>
Closes: https://lore.kernel.org/all/20260220191150.244006-1-safinaskar@gmail.com
Fixes: f8e05c10631e ("kbuild: Add top-level target for building gen_init_cpio")
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index b9c5792c79e0160b3c787f8a686bd60d9f8066d7..41f6a1917866119c472a8876134824aded20a616 100644
--- a/Makefile
+++ b/Makefile
@@ -298,6 +298,7 @@ no-dot-config-targets := $(clean-targets) \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 dt_style_selftest \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
+			 usr_gen_init_cpio \
 			 run-command
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name

-- 
2.47.3

