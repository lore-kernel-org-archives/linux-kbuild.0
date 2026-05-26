Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A768409119
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816574; cv=none; b=rmcrzH5GAjkL/l3KFyY3ocsXQr6rOJt1V9RRcIEBoB+AaHk4BZa7at2nuDMUUERfiRCGTz0Cp4xGA1AslFEW7nbWJrHgEpTeFTGMbqrx6X7e35CzCZOWKIfaD/RfBglny/pMqRKea+v1SiGyjuqbOZJCSeJzWmSccogzcj2LE9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816574; c=relaxed/simple;
	bh=IrM04IvPDo1sb9vHOovgPk1Y41bQl7xbfqKK2Qsjgi4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GXDy05tpKQsXZ/RN6XE7XnfYhAslxx0xaKCwBbop9jPi8XIOAyVmwhJbxuoveWn9YKCD0U/Af5vxHtDlGYt3ZiqRrDz7TWZIMlkxduCZ65xOSZb09JZc1DW2HqdcT0BLYZIgScHGt7FY9AZ3SaeJMNDwMgYBVpc7gE1FsXp2Kgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cU7sfiML; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cU7sfiML"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-1353a6f29deso8589752c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779816572; x=1780421372; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GSth3bH8wQN7DeJyLy/4rKJnmvPjIvLAam/FmnUx4yQ=;
        b=cU7sfiMLDU6gVECR76rMbwW26neasLjc3Raru1vsacodn4jKQrloQeGGtZkwId3lUA
         oaR0Ipp8JIzsW+K2PEvscVPJBg43JeaLPUi5oJ0cIUxseRwJ6x4e6KvPBz9OMzs0bwBh
         AQmMUMO9my3O147EsXyuz7QgoPOBsPLa72fPdrsrblYWs364CIG+SEcveuALs6J0XGd7
         O6Tc4wsqtaTD9th9asj3ApEjxwNb2ZE/UAw4YRrBhnwInl3GfM15X0iftuiJEPiJLz7T
         WszMYf4yZi1Fq7dGg9+TKVGKrP68K9ARcAoUrtj4fjwMgPcPYBqwduXzi0HKcMiWnV0F
         NRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816572; x=1780421372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GSth3bH8wQN7DeJyLy/4rKJnmvPjIvLAam/FmnUx4yQ=;
        b=DBAbl9HA9lP8ivOyV6EryjRPrYg0KRsaaBfh0mNGeW5sHzcKTSaFzlpxuF/D3IE6ww
         fhV/kKYUgNiDfACzgaHbSLpva0cZFB3SZTsEfmh36rbyjo6/fhgFl1FQDtPWGuvODbLw
         gbvXVDokjWcdVs9S1RIeZlSSXz5BAuEYUS4937I/tlfO+VISixk/EmI6X4YlPEkNE0Yp
         gNieOcg23eaVQ0znYErYLKPEBN67Qbl5L1m6r7QZWB/oWcbglFf39L/7EgXmyRhRqi5A
         TuR53BbWT0ehLCN/uxAhQZOUvYS/SsvYurddWiJCrkuhKNXB65gPEj6qmNXEqxCUKNqm
         CToA==
X-Forwarded-Encrypted: i=1; AFNElJ9M8Oe8XP/d9AfoGeC3yII9WMrFdDv4mgrmW9YbU+NSEHP1OHFyp5DrpcdSnA5MxWdnmqvH/4Vdu6bqvi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG3O70DveBqyKpjMtSpwJeft3BUOOefrgEzkknJH6O1LQd28E5
	5kuo+GiqRFioA8ZFSlWO1rVmOKCGW1cFmAj7H/oa5F1IqURChR2EAOWGHB07g2/b7GfZlg==
X-Received: from dlbef14.prod.google.com ([2002:a05:7022:f4e:b0:135:cc8b:4336])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:511:b0:12d:ceaf:ffcc
 with SMTP id a92af1059eb24-1365f812d65mr6760491c88.5.1779816572178; Tue, 26
 May 2026 10:29:32 -0700 (PDT)
Date: Tue, 26 May 2026 10:29:25 -0700
In-Reply-To: <20260526172926.2717929-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526172926.2717929-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526172926.2717929-3-xur@google.com>
Subject: [PATCH v10 2/3] kbuild: change --thin back to 'T' in $(AR)
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
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
2.54.0.746.g67dd491aae-goog

