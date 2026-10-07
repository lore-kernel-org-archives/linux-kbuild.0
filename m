Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B874839E6FD;
	Wed,  7 Oct 2026 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391103; cv=none; b=ZVczPKHW5bsnlK+dbkjxlfTbddkijAtRrWOvqag5uu1qLPaNuGExY1vrva7QrNf+6CULEOpWPXjAXQ4IrNeiW+DqLJ5HFU0zPGUDz+LKvbEXBSTVC0qnd745//u4E7BxGEH3yqJvGg+d1AlQ7kgzNXIcuu2yI9EqaoIcQgcwVKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391103; c=relaxed/simple;
	bh=rt+DI0Zaj7t1gLzFkXpDITiac40k4MGIO8meOBYmFCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FkP7yUos9Fhl6rmiMQMHaAu9wUfnZqHJuKYFkZUbOE2liiYghr9Wki0SIwx0jqQCJFUMwdjivS8uOzCMQGm7q4ct/XmJKkZftYRB4hkqPNMY3Kn4rMmsJu2PEEz0LjY1iqBBgUfDrEiLkCTT2xUNL1U5GUcLUyvm/e0ji6o3DGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UkFfAXte; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UkFfAXte"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4j0Jhn135gzKnYC;
	Wed, 07 Oct 2026 18:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1791391097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Ezflyex2QCq4IDhV46iLXvD5SXyLtu7Un9mXAhjKQE=;
	b=UkFfAXtexXMe4siEWkyoHJ7MLt9nnrmneb00G00NlXzSKyG2mdf+UNnktckKGk2nPnUkki
	ueDkpfo5Yq1KIJJq7XvES43wbpRTJOFu57yqBFD4LUn3Uofvxo/kEj3P07j9/axs+NKdwv
	CxUfTARcVHCHVOMSj7gnaFOEWz+UOxUlgM0ZTBjbV59KzB1vG1UVFJkvjVf8FIte5lgjYd
	jRVVoTd2irs6lA9k09ObJEmN8vp9J5joXIGZmHwK8MG3tuzF2dzXF0tnpXF37HRDV2SWZ2
	KqH91ITWRUWJvrK0lSp9YBxYVeHbhsx5vUzZzElveAvuHNYEMjjg/0dVg7AsDQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kbuild@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-debuggers@vger.kernel.org,
	tools@linux.kernel.org,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nicolas Schier <n.schier@fritz.com>
Subject: [PATCH RFC] changes.rst: introduce 'Required for'-column
Date: Wed,  7 Oct 2026 18:37:37 +0200
Message-ID: <20261007163736.3942745-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: dddea4e6f5fbbada107
X-MBO-RS-META: rx4z7z4tgdgubcmsyy11wmkig53ae4fe

The optional tag isn't obvious nor defined. Therefore remove the tag and
add column 'Required for' to make it easier to define the need for the tools.

CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC: Nicolas Schier <n.schier@fritz.com>
---
If anybody has info to add to or refine the new column I would appreciate it a lot.
Please forward this to list or people which can contribute to this patch.

There's also the option to remove the 'Command to check the version'-column
and refer to scripts/ver_linux - and with this also removing the duplicated
information-issue.

[v3]
 Rearange column space of the table in order to add column instead of replacing column
 add some requirements to the table

[v2]
 Ditch footnotes in favor of a column
 Replace 'Check Version Command'-column with optional-column
 https://lore.kernel.org/all/20260831152523.638881-1-manuelebnerli@mailbox.org/

[v1]
 https://lore.kernel.org/all/20260812122426.1636227-2-manuelebnerli@mailbox.org/
---
 Documentation/process/changes.rst | 97 ++++++++++++++++---------------
 1 file changed, 51 insertions(+), 46 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 28f2ca633..dafe0530f 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -1,13 +1,14 @@
 .. _changes:
 
-Minimal requirements to compile the Kernel
-++++++++++++++++++++++++++++++++++++++++++
+Minimal requirements to interact with the Kernel
+++++++++++++++++++++++++++++++++++++++++++++++++
 
 Intro
 =====
 
-This document is designed to provide a list of the minimum levels of
-software necessary to run the current kernel version.
+This document is designed to provide a list of the minimum versions of
+software necessary to change code, compile, install and boot the current
+kernel version.
 
 This document is originally based on my "Changes" file for 2.0.x kernels
 and therefore owes credit to the same people as that file (Jared Mauch,
@@ -27,48 +28,52 @@ running a Linux kernel.  Also, not all tools are necessary on all
 systems; obviously, if you don't have any PC Card hardware, for example,
 you probably do not need to concern yourself with pcmciautils.
 
-====================== ===============  ========================================
-        Program        Minimal version       Command to check the version
-====================== ===============  ========================================
-bash                   4.2              bash --version
-bc                     1.06.95          bc --version
-bindgen (optional)     0.71.1           bindgen --version
-binutils               2.30             ld -v
-bison                  2.0              bison --version
-btrfs-progs            0.18             btrfs --version
-Clang/LLVM (optional)  17.0.1           clang --version
-e2fsprogs              1.41.4           e2fsck -V
-flex                   2.5.35           flex --version
-gdb                    7.2              gdb --version
-GNU awk (optional)     5.1.0            gawk --version
-GNU C                  8.1              gcc --version
-GNU make               4.0              make --version
-GNU tar                1.28             tar --version
-GRUB                   0.93             grub --version || grub-install --version
-gtags (optional)       6.6.5            gtags --version
-iptables               1.4.2            iptables -V
-jfsutils               1.1.3            fsck.jfs -V
-kmod                   13               kmod -V
-mcelog                 0.6              mcelog --version
-mkimage (optional)     2017.01          mkimage --version
-nfs-utils              1.0.5            showmount --version
-openssl & libcrypto    1.0.0            openssl version
-pahole                 1.26             pahole --version
-pcmciautils            004              pccardctl -V
-pigz (optional)        2.4              pigz --version
-PPP                    2.4.0            pppd --version
-procps                 3.2.0            ps --version
-Python                 3.9.x            python3 --version
-quota-tools            3.09             quota -V
-Rust (optional)        1.85.0           rustc --version
-Sphinx\ [#f1]_         3.4.3            sphinx-build --version
-squashfs-tools         4.0              mksquashfs -version
-udev                   081              udevadm --version
-util-linux             2.10o            mount --version
-xfsprogs               2.6.0            xfs_db -V
-====================== ===============  ========================================
-
-.. [#f1] Sphinx is needed only to build the Kernel documentation
+==============  ========  =======================  ========================================
+    Program     Minimal      Command to check                  Required for
+                version         the version
+==============  ========  =======================  ========================================
+bash            4.2       bash --version           general requirement
+bc              1.06.95   bc --version             Kbuild (
+bindgen         0.71.1    bindgen --version        CONFIG_RUST=y
+binutils        2.30      ld -v
+bison           2.0       bison --version          Kbuild (.config)
+btrfs-progs     0.18      btrfs --version
+Clang/LLVM      17.0.1    clang --version          alternative to GNU C (gcc)
+e2fsprogs       1.41.4    e2fsck -V                ext4
+flex            2.5.35    flex --version           Kbuild (.config)
+gdb             7.2       gdb --version            Debugging
+GNU awk         5.1.0     gawk --version           objtool, CONFIG_SYSTEM_BLACKLIST_HASH_LIST=y
+GNU C           8.1       gcc --version            alternative to Clang/LLVM (clang)
+GNU make        4.0       make --version
+GNU tar         1.28      tar --version
+GRUB            0.93      grub --version ||
+                          grub-install --version
+gtags           6.6.5     gtags --version          to generate tag files through ``make gtags``
+iptables        1.4.2     iptables -V
+jfsutils        1.1.3     fsck.jfs -V
+kmod            13        kmod -V
+mcelog          0.6       mcelog --version
+mkimage         2017.01   mkimage --version        Flat Image Tree (FIT) or ARCH=arc, arm or powerpc
+nfs-utils       1.0.5     showmount --version
+openssl         1.0.0     openssl version
+pahole          1.26      pahole --version
+pcmciautils     004       pccardctl -V
+pigz            2.4       pigz --version           Compile and boot with KPGZIP=y
+PPP             2.4.0     pppd --version
+procps          3.2.0     ps --version
+Python          3.9.x     python3 --version
+quota-tools     3.09      quota -V
+Rust            1.85.0    rustc --version          CONFIG_RUST=y
+Sphinx          3.4.3     sphinx-build --version   build kernel documentation
+squashfs-tools  4.0       mksquashfs -version
+udev            081       udevadm --version
+util-linux      2.10o     mount --version
+xfsprogs        2.6.0     xfs_db -V
+==============  ========  =======================  ========================================
+    Program     Minimal      Command to check                  Required for
+                version      check the version
+==============  ========  =======================  ========================================
+
 
 Kernel compilation
 ******************
-- 
2.55.0

