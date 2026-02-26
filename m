Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3AD3D1CAD;
	Thu, 26 Feb 2026 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772141044; cv=none; b=DbsIkycpRDgHOQ1bxOvRH/JIuOdNlhrZF78IlrGYBn1zedprURJtR8W3j6QF2k26PUkuBbcLn/Mdm3q9pV3N41y+KXf52Kpf+b/nQSiS/1kllRvh3xkyII8r5ba+AOeXks3Kf1FNyEmiSCszSM7fKVfVCz+xgfRKVGlL0PiM6h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772141044; c=relaxed/simple;
	bh=1FGS6dDr5QSWYxYp5QuNzmjSC5spq7TyMCgQgfuw30U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DloFwIJKaiahLW2sv79F4yfmdbpzNl+PEu6N4bho/+YjjWVMQwGLB1uiyJe5R37MqmCvGNgkAWcZA7Tv19oQX+j2CrWmYorvt6UuKp5lRLFXmi2cRuQaQVUsWlo/Kcex4Ak8bJDwQ1lvrtoO96G3wZhzpjXixlS74DnsrJVUYyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=dj8wM5hu; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="dj8wM5hu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772141040;
	bh=1FGS6dDr5QSWYxYp5QuNzmjSC5spq7TyMCgQgfuw30U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dj8wM5huqb2s0LuFXw+u/ZsHOO0766xJDPaCEpa6Cgdxmbjr/VWG1v/3wuK/aXcfJ
	 IePJt1H8QoFXgVtwW8HWI3hLkfz7yknx1IdKD5lzSD3j4pA3TYzcZmM7OZpJd0rtlM
	 SmGMY11yTJHvlRCfjdNN+ARm/Q6kTh/cGoZcaK8M=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 26 Feb 2026 22:23:57 +0100
Subject: [PATCH 1/2] Documentation/llvm: drop note about LLVM=0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-kbuild-llvm-followup-v1-1-201cc2a492d9@weissschuh.net>
References: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
In-Reply-To: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772141039; l=1030;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=1FGS6dDr5QSWYxYp5QuNzmjSC5spq7TyMCgQgfuw30U=;
 b=eHxXDbtvP3pijsj0f6KTtXShy8g+969IfkcotMUDMA6VmXnLtz1DjnNgITpcXJFn0T7qZ0Cqw
 V07rs7s6sj9BvUCkxGoAtVxSLwe8IWML55+df2g48T9YUF/lky/4bWQ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Since commit 502678b88cb3 ("kbuild: Reject unexpected values for LLVM=")
LLVM=0 generates an error instead of silently behaving unexpectedly.

Drop the now unnecessary note.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/kbuild/llvm.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index bc8a283bc44b..441d8786fcbc 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -71,10 +71,6 @@ recommend::
 
 	PATH=/path/to/llvm/:$PATH make LLVM=-14
 
-``LLVM=0`` is not the same as omitting ``LLVM`` altogether, it will behave like
-``LLVM=1``. If you only wish to use certain LLVM utilities, use their
-respective make variables.
-
 The same value used for ``LLVM=`` should be set for each invocation of ``make``
 if configuring and building via distinct commands. ``LLVM=`` should also be set
 as an environment variable when running scripts that will eventually run

-- 
2.53.0

