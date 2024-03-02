Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6F2539E
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709520161; cv=none; b=G+a50k7InGFJRIPajtTMM2eXdf9x/lcrQTMseLZJlW+AeQJ1lvCso+jWoFcOHHctDhneq0JUnDtFA6ZeYRgz1amRMJYwwLq9ooJUhedP9/v6QXrjAf05+8tjVZDIQdM88r1PZuSDp3D1JfqLy/iDAErvCQqpqMq2d3i1v5WJYKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709520161; c=relaxed/simple;
	bh=s7CBhBU7qLi9t5r1ueMvvFJjpA27TYM68NKRMjxAnyI=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=iEdNMpEpHXvLcSFQwekI5RRI4N1nt7gDbL7q5Jyk3JXRQB3AoW2UkT5HxNVHiDXRpIK6jNlwFODhywi6u0ZepL0NP36zXbtH7CAfcP0vja1GH+XNL7Bw9YqQ74mFuCWN4oojZmWpxGyAremzvvfSNmSA8x0ag0Yu9ZFw0CcRNYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242cbm1022026
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:38:43 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242cb4O022025;
	Sun, 3 Mar 2024 18:38:37 -0800 (PST)
	(envelope-from ehem)
Message-Id: <a154d43419add122d4c1c9f27738029ca993c1de.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 18:01:15 -0800
Subject: [WIP PATCH 21/30] scripts/package: mkspec: modify use of ${srctree}
 to assume trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Once converted this script needs to match what the Makefiles have.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
---
 scripts/package/kernel.spec | 2 +-
 scripts/package/mkspec      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index f58726671fb3..987a67c9a969 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -63,7 +63,7 @@ cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
 ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEASE}/build
 %if %{with_devel}
-%{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}/scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'
+%{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'
 %endif
 
 %clean
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index ce201bfa8377..c599ce56b190 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -24,7 +24,7 @@ fi
 cat<<EOF
 %define ARCH ${ARCH}
 %define KERNELRELEASE ${KERNELRELEASE}
-%define pkg_release $("${srctree}/init/build-version")
+%define pkg_release $("${srctree}init/build-version")
 EOF
 
-cat "${srctree}/scripts/package/kernel.spec"
+cat "${srctree}scripts/package/kernel.spec"
-- 
2.39.2

