Received: from lemon.tzafrir.org.il (lemon.tzafrir.org.il [95.142.162.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F79238D31
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Apr 2025 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.142.162.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024133; cv=none; b=NuG75J/Y8LJijWfUL/tnsNxYMNxvWNwRdku7kAtaxEauA9vlRdd0ciK51fXLD5Ao3lH5OciAjKlibu675z2TIWP2wOTL5t4IbLnX8WQZsxXQR5S29cqrFOUDTjxN2f8Bko5kLsTbxBiRpy8Z/fTS5NEnAeaiEksR/1Uu7yhpr5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024133; c=relaxed/simple;
	bh=cGZYR11AEEj2Asr/9Xc8JQy0OhaDMRQzsRS1NKSmGNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejVpsG/nSvVAO6YjjwQ9q/5yhQFZ5tgT8fL6VFxMcVpFitar6R49lgVYBfE7yFdl+smYgZ7D9ekgKFJzE5oBeImYuUATh2qOkY8zUlTxB8zTlMkQtwaMqOsA6ESZz6ZQPm+3ZP49wVVnGRrTh3V91NpVKkYTs2/t3H1hd5TLNIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il; spf=pass smtp.mailfrom=cohens.org.il; dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b=MRaMejay; arc=none smtp.client-ip=95.142.162.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cohens.org.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b="MRaMejay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cohens.org.il;
	s=default; t=1744023549;
	bh=cGZYR11AEEj2Asr/9Xc8JQy0OhaDMRQzsRS1NKSmGNA=;
	h=From:To:Cc:Subject:Date:From;
	b=MRaMejaycSbHm+478oQrxGWQfiRxd7I7DnVHnOzJsDKGCzaVzhFgrgzjvj641yqkc
	 SCGDvtU9iEtzs3gnHVn/haHa3Qep+oeZyErArzdV6G2EgKgjqBTVrex7iazRzfABVT
	 ma+zifECZquJGMwLYcPa7xx4rK7FNC9HGeYhd2ATQIdeH5yxLppjCJJc064QveDl5o
	 vPhdgNH1IBIJaIUJq4gf4UDpiDImbHHn4zOsLfMDhGztENeC+D5n/Y89z0EGuUlD04
	 QHpmugH+Od3LIWR0UbjPgeIFPOylqY/GSZgObKcoR0q74XpYBXH5UHS6mgFvNcV1+W
	 HSgNId6uoG0eA==
Received: from malaclypse.mth.mellanox.com (unknown [10.2.0.10])
	by lemon.tzafrir.org.il (Postfix) with ESMTPS id 1E409731;
	Mon,  7 Apr 2025 12:59:09 +0200 (CEST)
Received: by malaclypse.mth.mellanox.com (Postfix, from userid 1000)
	id 18D7182AE894; Mon, 07 Apr 2025 13:59:08 +0300 (IDT)
From: Tzafrir Cohen <nvidia@cohens.org.il>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Tzafrir Cohen <nvidia@cohens.org.il>
Subject: [PATCH] kbuild: rpm-pkg: Include symvers in kernel package
Date: Mon,  7 Apr 2025 13:58:57 +0300
Message-ID: <20250407105857.2568209-1-nvidia@cohens.org.il>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change adds an extra file to the generated kernel rpm package:
symvers.gz under the modules directory.

With that extra file, rpm-build on some systems (specifically many
systems based on Centos >= 8) can create better dependencies when
it builds binary modules packages using weak-modules.

Normally it creates dependencies of type:

  kmod(foo.ko)

but with the symver information available, it will create extra
dependencies of the sort of:

  kernel(foo_sym_bol) = 0x112233445566

And therefore if a binary kernel module was built with that specific
kernel, the package manager can check if another kernel provides
foo_sym_bol and of the same version. This is similar to the tests
that The weak-modules script runs at run time.

Using gzip explicitly as with Centos 8 only symvers.gz is tested for.
See /usr/lib/rpm/fileattrs/kabi.attr . Centos 9 and 10 also tests for
symvers.xz .

Signed-off-by: Tzafrir Cohen <nvidia@cohens.org.il>
---
 scripts/package/kernel.spec | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 726f34e11960..2a2de5df83ed 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -90,6 +90,7 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEAS
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
 cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
+%{__gzip} -n -9 <Module.symvers > %{buildroot}/lib/modules/%{KERNELRELEASE}/symvers.gz
 if %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='test -d ${srctree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then
 	%{make} %{makeflags} INSTALL_DTBS_PATH=%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb dtbs_install
 fi
-- 
2.47.2

