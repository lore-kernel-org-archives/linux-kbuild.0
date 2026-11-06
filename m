Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956807;
	b=yIeKwIkvPmsQ6riIniUjXFZlNxWxzNdT4XfeGcUUP04sasA8BAeUeT2omplkLlzmVEIH
	 nflt2x7v76yibL6QQNJqplxsLpS3qDx2TKXAH9U2FX6IE0OuHsvR3zTXCn0jvPKZIR7Pu
	 als/IUIBPng7draJJsDn0qqss/f5w8vOHl6HBHwXEKH5kCOTrOrN+MATyLWRw51r4Z+jS
	 FMUdrSBk4yN1ZD8OQMLaphr4mxbEFk61LMTNcr7+m8ggRwN/3Qc3mZqKNYuOX3O2h70Uq
	 3PjccubQl6dlKLOfWfQ3t1+mHeqAMsDycWtOTV29j+U7GgC2EM7XUHKRcKNPNhpae9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956807;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X+RIYSJuCkjGJWvn9kpp/Ob8ans1MXDZ31RXyzn2feM=;
	b=Ke9BxN6liCc1AnA8c5jS60RJFMe+yLVdTENLJCksrRx5HZ/WzCN4LnVp9Jc1kGsyAs2E
	 nPtw/T0Cw87E14zoyN5QqMN7iDsD0V5UTBPazG5PeBX4hPnIcxc20ri6dxOlzUv6czDU6
	 sLRbm27pElqVisWuJHeT2mutOgYwz1/c4ZfSvq61RNlsG3UlVyDDpAQqkAGXXBn+BseG7
	 0A0GYagKlBdnmJlQLNYZ5hTpZ9PcP2pCr57GiXV6r9nGJ6uWOyEE2Fl0Br3cnAQHELOhg
	 kuXCfJaldZy5fkpm/vbqRxoRM/NU76xVcr0/8ZI2OB0BAD4Jelvpf9YiSJw9HioDr9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="F5D8LVl/";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="h2n+I6g/";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE83606D83C;
	Fri,  6 Nov 2026 09:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE83606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=F5D8LVl/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=h2n+I6g/
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793956804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+RIYSJuCkjGJWvn9kpp/Ob8ans1MXDZ31RXyzn2feM=;
	b=F5D8LVl/3SApjCCnn7gjsfFA3kDUgE5L18DqzS+K0mebjCevbonA5Ed9fnS2fbiP8gUg9/
	q5XKv9obqayddERdq3P4Nkbg8mH8zmGyK11IhRogQfwERJi7WsZUQqGs2IsMQ6lW+j+u//
	9aau22bSMxKR8LbV6qaU3tR9+WR467+aE2sAyBCvPty6k42ozCg1uZEfVrJQLEBLNPggyl
	tUwuvRwb3dB2sIMgx681lxEyR3qxZ/U9+uBqUluR9oozFgyy/YA+zE+CDP25bZSsNSWPVz
	NZKjkf7Vn4iZ+wHFwQ1ocVjwn8PkHOgkxAYSmZcSeWIvr9blKY9wIPaCcMYQfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793956804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+RIYSJuCkjGJWvn9kpp/Ob8ans1MXDZ31RXyzn2feM=;
	b=h2n+I6g/N7m/SKZ26rk/pwtV7u20l/d0Lbu6WlZpHB6YwrerHWYj84m1uiXKAOgA21Hawb
	RBBpuHxGBFzOiMAQ==
To: Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Derek Barbosa <debarbos@redhat.com>,
	=?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
	Daan De Meyer <daan.j.demeyer@gmail.com>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	linux-rt-devel@lists.linux.dev,
	debian-kernel@lists.debian.org,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 09/10] Documentation: Describe kconfig-checker overlays
Date: Fri,  6 Nov 2026 10:19:21 +0100
Message-ID: <20261106091922.7560-10-darwi@linutronix.de>
In-Reply-To: <20261106091922.7560-1-darwi@linutronix.de>
References: <20261106091922.7560-1-darwi@linutronix.de>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 Documentation/tools/kconfig_checker.rst | 57 +++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/Documentation/tools/kconfig_checker.rst b/Documentation/tools/kconfig_checker.rst
index 73717ac56ea9..152bc0c634ea 100644
--- a/Documentation/tools/kconfig_checker.rst
+++ b/Documentation/tools/kconfig_checker.rst
@@ -18,8 +18,12 @@ The checker can be invoked from anywhere in the file system::
 
    check.py check -c path/to/.config -r preempt_rt
 
-As described in Documentation/admin-guide/README.rst, it is also used by
-``make checkconfig``.
+An optional overlay may be supplied with ``-o``::
+
+   check.py check -c path/to/.config -r preempt_rt -o path/to/overlay.yml
+
+As described in Documentation/admin-guide/README.rst, the checker is also
+used by ``make checkconfig``.
 
 External dependencies
 =====================
@@ -47,4 +51,51 @@ The checker's rule files are written in YAML, and are stored in::
 
 The schema for these files is fully documented in::
 
-   tools/kconfig-checker/schema.yml
+   tools/kconfig-checker/base.yml
+   tools/kconfig-checker/rules.yml
+
+Overlays
+========
+
+An overlay is a YAML file applied on top of an existing mainline rule
+profile.  Overlays are intended for local policy, distribution kernel
+packaging, CI environments, and board support packages.
+
+An overlay may override fields of an existing rule.  For example, if the
+mainline PREEMPT_RT profile contains these rules:
+
+.. code-block:: yaml
+
+   rules:
+
+     - name: CONFIG_DRM
+       expected: n
+       severity: info
+       docs_hint: config
+
+     - name: CONFIG_EFI_DISABLE_RUNTIME
+       expected: y
+       severity: medium
+       docs_hint: config
+
+A board support package may override such rules with an overlay like:
+
+.. code-block:: yaml
+
+   rules:
+
+     - name: CONFIG_DRM
+       expected: allowed
+       rationale:
+         This product requires a display controller and accepts the latency
+         cost.
+
+     - name: CONFIG_EFI_DISABLE_RUNTIME
+       expected: n
+       rationale:
+         The efi_runtime workqueue is pinned to housekeeping CPU#0.
+
+.. note::
+
+   If a rule is generally useful to kernel users, please submit it to the
+   mainline profile instead of carrying it as a local overlay.
-- 
2.56.0

