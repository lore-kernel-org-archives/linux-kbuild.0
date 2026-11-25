Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587408;
	b=4MtU6zN61HaJzfSQqgPEp1PmlmHYiW1fr0A3kj5jZgMrUc1BMwmEqlLlzg3gbeGHd6H0
	 711OyemYjSGez/6z5AIvL9JVCMmZMdRimrVnZW1HiHBhMhc9o6r6f/ecE4vCaanoLrEPx
	 ehWjvbzWjBlwTz15BljmL0TsOzAwekFjATGoxEOod/otkkzg8zbUMk7Cqt9faiVm86iSk
	 pvJdoA3yeeJWORdZdR3HHai/dp8OfdJSuIrXvDngoAndi7oiF2wennuZYjC5+3MhgH573
	 jpwucCYwNq1c9nE7k/Dd9TaUZ7MWJDwRbmJA/O+JMAP0clh8X2BIsz9uCs2QothNWmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=;
	b=zFBHK1YOI/HVhRoc1kWSQ0hiiqpTx3iQCIlVuNsNpO3o+5CDyH5HCXyOQ8vSSvcFgmW7
	 vudQ4TTMnGtVP2ajw0b/03W+LH1b45F5T25OhoHY0p6qCUKCe09GbFtxF6bbE/1LsoukA
	 HbWthfWE/RHJa8e5coRGyFyfSl9bBayOr8qIb16qa4VEAXlZnHZtxkibW5bzLF2gI7ly8
	 a5MhzGR4VSTrPLT9oJEfE/cyercUYJsxDalEjjoqsngg3+vel/lndaljg3um39IOQpbpZ
	 Oz3jVzUf4McHw/8rNzuvibOLZrNzQ6UUAprqfq6wHnVZZeddn+Rd4bbRngNF5Hpei5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2pTrFMJ;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CED606DE57
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2026 06:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63CED606DE57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A2pTrFMJ
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b587ffea77so325978c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2026 22:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587408; x=1796192208; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=;
        b=A2pTrFMJIfsCkS+FQGT671ur2Mpg3phgQVSo+9pmmEK/kDi+RicDzAm8UjcOxLv9DR
         AybPZBi6Y+YuhtClXyN8ZamlY8PXM6mVORzZnlcdPtBI66DKDm+UOEGp8v3ddu6/1DVA
         AfALevxeVBpIYk00sNHVb/r2xPOvmgJa40SuT81YOoeNUveMVAen4g2b/P9k+UNw758h
         poWfHwmbONsayWFaGylPvNwzADThwwn2Bp6VGZ1uhkk2EMIxxS/tMKL3J/0N4CD7GJNo
         FHP7/p8Sm0bKjfes0PV8ZmvMVRV9GvtY26teD+BMwZqA/z5VrrQsXD91XBVRa4JR4Gqe
         p3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587408; x=1796192208;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJ5Bj2HUeqnSIN+0jmezTl4ea1LIGCfrIoPbd+y7XVY=;
        b=1xTsuP4aHyvnXuzI0wT8nJBC9DS7LzOw5mjTty9pnTTqkmnoV23r1/tIho9gFKt3XN
         u9HZJZpzwo6URIpv5fFO9p7SKJvBjQBfNCKUKApZc3BroBeDlmg7iI6gSiRNqSrE8aPl
         RERFLUmWo6uirJcGUPA6GmUkHIAY1bQ7h9RH9yjqgefiyBjjZh79bS90zGnA2kCW2+U7
         1CPor+fEwcGuTo6Hv4iE063s6/2O/5CzWbNTRRDwd1joziF+6aMWDAW5EaJEsPaPb1pQ
         l5iGNgU40dIlCkL2KXf3LfEri2f8RpSfwG5nvUX7o1C1P/xxxr8u/9vdUTp1qWnsSspj
         8iuQ==
X-Forwarded-Encrypted: i=1; AL+hErE8jYtp1A/cnxutQd9OQRxG1KSBuagpIbSJM03Ds9Y14fmZGqIyIVKYlAehtdhiTro9dfvJBRnQ2iwnG+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TA6g+Lp8q5lS3GqKdEpboc3SriSz/5i2sUyqAzbsJ/95Mr9ZE
	mhzAC+hApyK7cp7KV3oUk/jUSb6MykHve2Cqv4g1ChGrrXYD1epQB3MalsnPxR5mN1712vSnc4s
	g00+38D+Hwg==
X-Received: from dlar8.prod.google.com ([2002:a05:701b:21c8:b0:1b5:345d:ed30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:cc88:10b0:151:6e80:ba7e
 with SMTP id a92af1059eb24-1b5567dcec1mr15970822c88.4.1795587407220; Tue, 24
 Nov 2026 22:16:47 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:18 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-26-irogers@google.com>
Subject: [RFC PATCH v2 25/30] tools include: Add linux/uaccess.h stub for
 userspace tools
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a minimal tools/include/linux/uaccess.h providing a no-op
might_fault() stub so userspace tools under tools/ can compile shared
kernel code that includes <linux/uaccess.h>.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/uaccess.h | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 tools/include/linux/uaccess.h

diff --git a/tools/include/linux/uaccess.h b/tools/include/linux/uaccess.h
new file mode 100644
index 000000000000..5a9e6bf4cfb5
--- /dev/null
+++ b/tools/include/linux/uaccess.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+#ifndef _TOOLS_INCLUDE_LINUX_UACCESS_H
+#define _TOOLS_INCLUDE_LINUX_UACCESS_H
+
+#ifndef might_fault
+#define might_fault() do { } while (0)
+#endif
+
+#endif /* _TOOLS_INCLUDE_LINUX_UACCESS_H */
-- 
2.56.1.831.g720f3f5937-goog

