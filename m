Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5CA3264CD
	for <linux-kbuild@vger.kernel.org>; Sat, 28 Mar 2026 01:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774660781; cv=none; b=BvfYG/ydzpiQLCxpUKtIXrCxL0Xnrqdw80z/Z/jMyPJ6SmmuOMPFSV8oGTbaitSYxnMxtbgeSdfOIp0NY5nmw/D+9JABalIpHJf+9YwJ9/5Ai/T/iixPkm1NIUN8+grvXWUdjcC9x0G62SQaaA2tDHBwPHjrrnhfXB+zDAWmtwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774660781; c=relaxed/simple;
	bh=1dn6wx0kE3uz2URoABPgvTVUTzuMBnxMjei6SlfoEfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aD53PUT2rUqFj+tdeSOlnk37FJi0AHiNQbwWwh0d8bHEWGQqthCSvfaXRhUHVrLgL5X0pHsurn63hslKqloW5XX51uP4fUMm5SMgPl04RRqzuRXu9FxSwaiE/Q3dkCAB0YSDFdRaB8BVaDlcXZJekTjRE/xtznxrj5HboNt1Ans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h2ua+E8g; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h2ua+E8g"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12721cd1a2aso3465618c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 18:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774660774; x=1775265574; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=h2ua+E8gFbXMBfrRsdEeyUM47RjQtAIztjV3lhVUeTDOc0r9ob1FxicEpwet1UDndw
         nyNVDUupMeT/BqGmLE6ivQU8KCxjwvtu6pSpdgECd1YItQI1EInTTeK4wtvORo6c3UtB
         x9hWDnh90o5GIDWoZaKKFvCEccfXlny4EQtoHKLOpIF+nPafchpTx4sP4KHjwit9sQa+
         v2ij7aybUTz8QoyI7boQBLtL1s2MJioPHrgyKIiddihFij8ZcKyma2z1eQxBZieGpdO9
         D6MOMAgwaPgOsrX8lP5+fGy8F+8kHM8SEtREyDKyFQOcVw32+RZrPLcz4SJVBZS1ghd5
         0oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774660774; x=1775265574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=kWgqM8LN9mHIPrfb7THmPeAdz+pG62JcRLACTKMoQOyANf1pd1ey/0vc1JQPAtlrmu
         2AFYgqvolnmGMKD+KdNqWbK0025z+1YJ0GI/E+b38UdMUfgptbMiTjA6u6n7duZCy12M
         D6oCnOWEei+E3jdB6r/HJyhXlyAngNYvE1brOT04fkBNwNp4Ybo5lXExcPBCdfCOwu3s
         ECLNRF5NMyPBPRRsQG7GxVg8E/VvkKaaRoFliEeScvWTAU9Fo206PB7AkQsckQsnNC6g
         AyCHigtDgvHMMkmYUq17lWkz7g6D/qK/1H/jJbqQA7ElFa2cm+qrJlIziciprL8O6Sc1
         BQeg==
X-Forwarded-Encrypted: i=1; AJvYcCVPLNRZ1oza2RK+NjebelKTSH7yblM7dRgv7N4dsnEwLS8XqN7UDAys8K0SSFQhkLJQ7gLkr5vWpwLc6lU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg5AMQu9Np7dbo7mf6VDAREA/rQyW/sWHsNbn5PAnoRsvcDS8w
	kswmTo+VV8Iv1oTv8eHWMEhKlNb7gxT0aZW8Xfoi7hDF6jY2jpO610M2VHv19jwqNowqKg==
X-Received: from dlec5-n2.prod.google.com ([2002:a05:701b:4285:20b0:12a:ba56:cfe4])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ec1:b0:128:d51a:5143
 with SMTP id a92af1059eb24-12ab28ef2bamr2473080c88.31.1774660773994; Fri, 27
 Mar 2026 18:19:33 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:19:26 +0000
In-Reply-To: <20260328011927.3569802-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260328011927.3569802-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260328011927.3569802-3-xur@google.com>
Subject: [PATCH v7 2/3] kbuild: change --thin back to 'T' in $(AR)
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

The '-T' flag in $(AR) is no longer problematic since the minimum
requirement for LLVM has been updated to version 15. As of LLVM 14
and onward, the '-T' flag functions identically to the '--thin' flag.

Fixed the issue seen on IBM Power11 System:
  ar: unrecognized option '--thin'

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c1ecae82d@linux.ibm.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.vmlinux_a | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
index 9774f02b43b2..650d44330d1f 100644
--- a/scripts/Makefile.vmlinux_a
+++ b/scripts/Makefile.vmlinux_a
@@ -10,12 +10,12 @@ include $(srctree)/scripts/Makefile.lib
 # Link of built-in-fixup.a
 # ---------------------------------------------------------------------------
 
-# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
+# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_builtin_fixup = AR      $@
       cmd_ar_builtin_fixup = \
 	rm -f $@; \
-	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += built-in-fixup.a
 built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-- 
2.53.0.1018.g2bb0e51243-goog

