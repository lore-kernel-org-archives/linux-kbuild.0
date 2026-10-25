Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=24.134.29.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946825;
	b=lMhf/bd2v1j4omUstFRiQbnKtp9DER40Tkty3tCByO3vlD0RgQv4Ta2w3s/A9FrnPm5J
	 eyIWwPKjV41gJymK9GGlT4VcJJZoIV9BObTRWWByPp+CS+YSQiQM13I/MMfvci5RepTbg
	 V/sNNJnGIK4i45oCLqRwdJoPEGpvdQgoCkyTCDO2wAcbI4dlXj+6sqvLFg92Ch1Yjjrix
	 77Nr+77ECxLoS1J1+T3PISej7vI71M3FBoeu249DZjKiHdMDDlRM6FlHwdWETgIXaEflp
	 z4yl2HaxMvXbAHsCsNOelL1VEBGhESeGKneDW0UXCNaWp8X73L4+t8VmV20FZaZu8kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946825;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=aRwJSWzihIVxmJq2V6ZP/pplaH9twcid3AOfCUTyQDg=;
	b=y3lyQwJOTGQrNWEJieIk/lnO/6KH9pY1u3ruzRv5KGFTULVULeBKaxabdP17kVfEjYzB
	 cEa4n9QKPo9twjk4u/Tz2AWdp2bpKce1YdScBWRrsnfNL9iZGFPYHp7twxFVOUJXUjR9h
	 hHf+dBmhmwezU/TqvltDX1iCLdxaIWeTnU4kU5a584aS9hksRNdmMKQ0nPgUgyTcUHkUa
	 Rhr8wuVYRuLiV2/8DVuWRMV2GxQ3R2anFKQMYZTjIgjNsi2Q78C8caSxfd0NixEGML5LJ
	 snYJl98vJRTRgTXTaVgQXRnaiS1Gg84dE/EIM5klp3TOABshiNxJ8Y5hB0WYBU4hhsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sigxcpu.org;
	spf=pass smtp.mailfrom=sigxcpu.org;
	dkim=pass header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=lqLFlu5V;
	arc=none smtp.remote-ip=24.134.29.49
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27279606A321;
	Sun, 25 Oct 2026 16:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27279606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=lqLFlu5V
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 262F6FB05;
	Sun, 25 Oct 2026 17:46:54 +0100 (CET)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjveHT5wZB5v; Sun, 25 Oct 2026 17:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1792946812; bh=44WP28avd+3fSybiAEPgLAdgA/SAV5k4BHE39+BTC+A=;
	h=From:Subject:Date:To:Cc:From;
	b=lqLFlu5VcwyITVnmBlV/L2jr4dswmmk61mBfkK+K59ILmzkqLro610mC/vlMVRJWh
	 krHtC10nDjZ2FVPl4U6aFRvg7i5hJFEH23/3uwNdJTWc096qvGz/wpXcvRmEeU329u
	 zSkwyCs1NgdKAaHaF52YG4JoyfmAlFzgeGDoGj5dbDuMlundvXvMutevMKaCBNi8Xa
	 LA0XYZUMFn/k6S9tuC1qP5Yc2Kjd9oWU24psNPJjII0SET1TWz9sAqyGic2i7dCvfX
	 6VHAZpd5CCO3ntEgVjZCefjMeRtNhySwDPzZXsZRLFYDl0uEfwQdOqrvWOZtqqfIpV
	 3G+Vd1sYJEotw==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2 0/2] kbuild: deb-pkg: allow to set package name version
Date: Sun, 25 Oct 2026 17:46:34 +0100
Message-Id: <20261025-deb-pkg-v2-0-8c33a4ac18ad@sigxcpu.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNwQ6DIBAFf8XsuTRCU6A99T8aDyILbpuoASU2h
 n+v2GOPk8ybt0HEQBjhXm0QMFGkcdhBnCro+nbwyMjuDKIWktf8xiwaNr09ayU6oS9KaoWw21N
 AR+tRejY/jot5YTeXeTF6ivMYPsdV4sX7rybOOFNOo6yNQYvXRyS/dtNyHoOHJuf8Bfg2f2qyA
 AAA
X-Change-ID: 20261019-deb-pkg-a6ef2837687e
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=44WP28avd+3fSybiAEPgLAdgA/SAV5k4BHE39+BTC+A=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQnEzako0YVRkQVlLYnM4YmZHTWhmYWU0WFQ0ZDdKCkM0OThvL0JHaFdreSszMVJO
 T21KQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYXQ0eWVBQUt
 DUkFsdjRaU1N2ekI0NFhuRC85dldMSHpySVI5WWNjUHYwZnRaRFMxWlNGVmhUeU5RUWdDZUNCcA
 piVUovWUc3cDBXdzQySXROSWVqWjJFVVdmd0k2SSs1TTR6SGdZNHB3cXh6RzBqQ2xQNnBpNGkzb
 jZaaXBJOWJUCjlPbzVXbzlBc0VpcUVqdGwwTmxUSml2RnQ1cWlrQzNGb3lhSnhSMm5Sdk82MFN2
 bWpSaTJqYWZuQ3pCM0szSGwKTEJ6L2xqbVIwMEY1aVJ3N2Z3cUdQNjh4OGhIQ05DSE9mSlNpWXJ
 JL3lhZExTcXVFOFFXeCszcGppc1hkNjY3WQpkZjRhMU16Umdnb1hmV0NhcmN6cEtIRXpDUkZaUE
 t6LzE4MlJGVU1RMHE3d3N3eGdpck52NWhKbmJyK3dtTjB6CkZ3dkR0NW5oSUhCSzFicitFKzN0T
 2lZYkF4QXVYRkY2WFdYNjI5RVM5UW1pb2s2SU5PRWFvRnZoczNUc0ZEa2MKU2xOaXNwbTJxZUU1
 VnlER3hGcW8rQytZM3RyRmhOT2hNOHdtL1NwRDZEVE12elRYU0pybGtEdDhsY1kwOG1adgo2WE8
 2VVdXdW5GLytZMGFiaGRPc1AwenBYK202Vm5hUDhXRUwxbGdLVU5uL0NlM3pFNnJSbXpuell3WG
 JoZlRzClIyKzlHQVl4WFQrMVEzbFpSM3ZCRXo0a0QyOUN5T20xVGFXQkRWWG8xOTAyWFJxZlFFZ
 Fc5L0dLNXQ0eGJnbngKL1UyVjFYdDEzRERYSVV2RExublgrT1FkblZkcXkrRDJTK1pnRDNNd3BY
 clhBKzZ3TVBtTEpaYkt3YVUwSnB3Kwp6WWk5OStTNXNKRUhObEZuQmNjdGUxS1g0VzRoWGtFQ0d
 sVThTYkxwZ0JIMFZvVm9yQXhnMlg3NmVJZlZHTVh1ClJkR24xZz09Cj1FazhKCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3

Instead of hardcoding ${KERNELRELEASE} in the package name allow
the user to override this.
    
This can be useful if one doesn't want to accumulate different packages
for every commit or micro version bump by setting
KDEB_PKGNAMEVERSION=7.3 or even KDEB_PKGNAMEVERSION=stable.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
Changes in v2:
- Let "scripts/package/builddeb" use ${KERNELRELEASE} when referring to
  the kernel release rather than using $version. Split into a separate
  commit as this can be useful on its own.
- Link to v1: https://patch.msgid.link/20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org

To: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Guido Günther (2):
      kbuild: builddeb: Use ${KERNELRELEASE} consistently
      kbuild: deb-pkg: allow to set package name version

 scripts/package/builddeb |  4 ++--
 scripts/package/mkdebian | 12 +++++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-deb-pkg-a6ef2837687e

Best regards,
--  
Guido Günther <agx@sigxcpu.org>

