Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844428;
	b=opoPftVDYJkg9HYt2yEVwTcsaRFpifxZgzNxq4ggis/u8q1Sb6/B94KWf5uQHh5Isfeo
	 w4sFsz63Twog9O6W124TCaPiQvd52D1RgpHRPooYhtseOIaC/dEdduU0tU7iqc+UJ3HuK
	 OgesDBmwAUWR4KM10QbcTAMcTipSlVoJVUAJO9UKnkWNulUHL5OpGnyuI+2R0dlyg18tP
	 cUaqHY7GXaJbGPolBJIWKUsH1LcEcZ4gQpFp5cDNahsbrIAyKs3uEJbeo47E8i3pd4BA1
	 MK+/eJ4R3mQVn0FmiZa7uWGtQ1domjdrIIh4w13IRk/90V6tmyc1n3YrccPLSMvH7Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844428;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=c6A1A6sBiB1tVjJ7aeaK0/VjZv77wQNeEUxCHBc28tA=;
	b=lOUyruC8IgjSSi3whZ/59C53m4evsfGiDHWB3Q2KhoJtronEHxWI2p2Jg9ynA5pFtAkq
	 Z1D4cvcz7QQCCoNcxnhdhGQJGZ9j+HKQeQSxnC/vIb/K/O7MeIO4kCui8+LfsMjI3lnPX
	 Fjs7Vnf66qd83fHHAixzXSjzqvToPMQRFwyN5epIynZaOrKVQgSzAXhhWO5JO5EJJsdpO
	 f9PctflioktzCPbNcsT6WOGlhXLNTWHf/W5HYK80Y8yv/16nSspIXQ9JtCQcUcZO5uLGZ
	 MvO3BH7wmC2q2HfoPn2/Ey9G7Sii5JIT2FnYuD8c6GyK9c5aG5odoa/GvxDoU1NwAlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYDkERj9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id AD737606A33F;
	Mon, 16 Nov 2026 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nYDkERj9
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B94C61F000CA;
	Mon, 16 Nov 2026 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844428;
	bh=c6A1A6sBiB1tVjJ7aeaK0/VjZv77wQNeEUxCHBc28tA=;
	h=From:Date:Subject:To:Cc;
	b=nYDkERj9S8ZaZJtA/ErQAR1RIaRJSHSoVwLu/SU2iKkR/JX5awq+HPkjf5FH4sbBD
	 2sl9/ljAdhLIjH/pRjHaBgby2d/lMfefbXRo+up/YyKCVLtD9LaGk/WqEbUnQLamGk
	 zPJyIR/dBIlPB4QdzVVPSC1v9asXJNe4ecyWosAggmE7n389lDvmMFtcYDxBcNLD5N
	 vJ+jXdwQMG39tN7JEjtOArwUbuKrd/fq4RhpbebtlYLUOwFGU+henmdj3zlg+Le8ok
	 ddjQL5SZNX8KS8oiPSQVQMhJqoGznwOiWjeodY5DQgi0CTIVRUxasFD5Ch4ADquWRb
	 zRK/Smkhgja9Q==
From: Nicolas Schier <nsc@kernel.org>
Date: Mon, 16 Nov 2026 16:52:48 +0100
Subject: [PATCH] kbuild: package: Install System.map to build tree only
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
Message-Id: <20261116-package-install-system-msp-to-build-dir-v1-1-ec53d3d39146@kernel.org>
X-B4-Tracking: v=1; b=H4sIANIm+2oC/yXNQQ7CIBCF4as0s3YSIE21XsW4gDLVUUoJQ42m6
 d2luvze4n8rCGUmgXOzQqYXC8+xQh8aGO423gjZV4NRptNadZjs8LT7HKXYEFA+UmjCSRKWGd3
 CwaPnjMb1vT+N6qhbglpLmUZ+/54u179lcQ8ayp6HbfsCT+sRjosAAAA=
X-Change-ID: 20261106-package-install-system-msp-to-build-dir-2b99d8f0714e
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Christian Heusel <christian@heusel.eu>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>, 
 Nicolas Schier <nsc@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5283; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=qoHYP6lhLzSoGM/ZxrmtyRQL4jLkf7BehSLsAPLr6Vg=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBq+ycB6TvJXPbIEYhxBeFFlQjoby2ECtdU977Uu
 8y8v6bOaq2JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCavsnAQAKCRAHUgpwFiYS
 aX/QD/9jly1IFYVphPlIE2Gq0740AkEQFysJNMQ5AFie8/M3m2MerVznLjyue+P/Mj1MeOLXW7g
 RPehu4eJbDy1R7f0ZUDlXd3DEzEInnakGPqJOYhYB8Sfou1t7MXS9JMXyuaUEgm3ci9SqRYbg2C
 V5X4gUfQ0Jk+ZjjMjo2r/Sk1GywZ4SpM1D5Q2XeCBYDIlUPFD4YCPckwx5FdJsV/MVb9y16smC6
 HC3mAELGBP8nsUuHgczFtfVE0wWSt0QvuoPNk0llviuXfH00JFoV2sL126FL23NXgcZA9EoZt3l
 5QRru2h3hm3PKH719q9yHgupZpDbC/fNak1IoOd5+5kYJzg7q0rBSf55Lb0z3B2HEmIfmk1kTft
 gH7XdfrXriRKzddvtyrYnOSMvoXd/QPLol1cAgC1Iy4soAVQHGZj+QOMM1a/6CZxWx4GVkiLf0h
 s6XR4usJJmUUcCODopAtuH8kFnw3Bp0xbsYkFwiMc748ZAI9cqVRqHrWUR407urYhEZdCjfRArW
 vt+4yEE034t2b670TwVGExo36HNdm3L89CBIC4XeiHCNHBY6FqpnVuthuNJ7J87WIB3ICGOpxBV
 ljTdfgdopte3vx7PiErtrkKlSPOBEXww3AA8lhA4FMADli1rYZNbrFw/FvVmycSacdZ1EtXWyE/
 e3/t2nofV9o0Osg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

Unify the installation of System.map for all packaging targets and
install it to the packaged kernel build tree.

Kbuild's scripts/depmod.sh expects System.map to be available in the
build tree to allow depmod to check for unresolved symbols in all
installed kmods.  The script is called by 'modules_install' for in-tree
as well as for out-of-tree modules.

Adrián García Casado reported [1] that the Debian packages produced by
'deb-pkg' or 'bindeb-pkg' do include System.map at /boot/, where
scripts/depmod.sh does not find them and thus refuses to run depmod
after installation of out-of-tree modules built against a packaged
kernel tree.

The 'pacman-pkg' target already installs System.map to the build tree,
while 'deb-pkg', 'rpm-pkg' and 'tar-pkg' install it to /boot.

Replace installation of System.map from all package target specific
scripts by installing System.map to the build tree via
install-extmod-build.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Adrián García Casado <adriangarciacasado42@gmail.com>
Closes: https://lore.kernel.org/linux-kbuild/20261016111106.221542-1-adriangarciacasado42@gmail.com/ # [1]
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 scripts/package/PKGBUILD             | 3 +--
 scripts/package/builddeb             | 1 -
 scripts/package/buildtar             | 1 -
 scripts/package/install-extmod-build | 1 +
 scripts/package/kernel.spec          | 5 ++---
 5 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 66e4b6a37783..ce8e0bff9041 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -90,9 +90,8 @@ _package-headers() {
 		"${srctree}/scripts/package/install-extmod-build" "${builddir}"
 	fi
 
-	echo "Installing System.map and config..."
+	echo "Installing config..."
 	mkdir -p "${builddir}"
-	cp System.map "${builddir}/System.map"
 	cp .config "${builddir}/.config"
 
 	echo "Adding symlink..."
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index ba1defc61652..9f8a4a69059c 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -48,7 +48,6 @@ install_linux_image () {
 		gzip "${pdir}/usr/share/doc/${pname}/config"
 	else
 		mkdir -p "${pdir}/boot"
-		cp System.map "${pdir}/boot/System.map-${KERNELRELEASE}"
 		cp ${KCONFIG_CONFIG} "${pdir}/boot/config-${KERNELRELEASE}"
 	fi
 
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index cc87a473c01f..057ca4fc7d71 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -45,7 +45,6 @@ make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_
 #
 # Install basic kernel files
 #
-cp -v -- "${objtree}/System.map" "${tmpdir}/boot/System.map-${KERNELRELEASE}"
 cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
 cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 
diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index f12e1ffe409e..fbf8d3e5ab5f 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -37,6 +37,7 @@ mkdir -p "${destdir}"
 	fi
 
 	echo Module.symvers
+	echo System.map
 	echo "arch/${SRCARCH}/include/generated"
 	echo include/config/auto.conf
 	echo include/config/kernel.release
diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 46e80970f723..37a547299a94 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -114,7 +114,6 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEAS
 # DEPMOD=true makes depmod no-op. We do not package depmod-generated files.
 %{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} %{?install_mod_strip:INSTALL_MOD_STRIP=1} DEPMOD=true modules_install
 %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
-cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
 cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
 if %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='test -d ${srctree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then
 	%{make} %{makeflags} INSTALL_DTBS_PATH=%{buildroot}/lib/modules/%{KERNELRELEASE}/dtb dtbs_install
@@ -132,7 +131,7 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
 		echo "%ghost /lib/modules/%{KERNELRELEASE}/modules.${x}"
 	done
 
-	for x in System.map config vmlinuz; do
+	for x in config vmlinuz; do
 		echo "%ghost /boot/${x}-%{KERNELRELEASE}"
 	done
 
@@ -185,7 +184,7 @@ rm -f debugfiles.list debuglinks.list debugsourcefiles.list debugsources.list \
 if [ -x /usr/bin/kernel-install ]; then
 	/usr/bin/kernel-install add %{KERNELRELEASE} /lib/modules/%{KERNELRELEASE}/vmlinuz
 fi
-for file in vmlinuz System.map config; do
+for file in vmlinuz config; do
 	if ! cmp --silent "/lib/modules/%{KERNELRELEASE}/${file}" "/boot/${file}-%{KERNELRELEASE}"; then
 		cp "/lib/modules/%{KERNELRELEASE}/${file}" "/boot/${file}-%{KERNELRELEASE}"
 	fi

---
base-commit: 7924b82075ab1aee61be04764152cff49257c449
change-id: 20261106-package-install-system-msp-to-build-dir-2b99d8f0714e

Best regards,
--  
Nicolas

