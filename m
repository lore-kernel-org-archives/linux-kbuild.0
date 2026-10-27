Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133285;
	b=NkFnNyrbxrGKtfIKJQ3ulyeS+4or1G8hW7CqWEzaBIVQEfZgepbwyKxi2YQ9Fyu0Mn3v
	 zoodOeSktOxmGi3YoZXh8mX3bpV7vCSRkkWL6zR7cON2egx1wVAFMi8FM+r7j/iy7LT4X
	 2QCrIeSkZH+fIE9/43NhE/tSa6Zum3dUkNIqsuO8eK3dQ5EutonEMItcZg8LjLUAPb6tC
	 mMmKd+5A6iGLDLtvuXTdLZ7CLPKPYxu0i6V55QF+U/ByWM+olKSSpsVzOAj+d0OyIYGLZ
	 ZC3t1ScXdpiz3GWJ0UDloaz6KIRKaqt+KqOLZ5MQT2tXGbNU7aF1e8kc1oxAFaUH72g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133285;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hNorLwJ99xn/nj+HoxN7hSYWomO5ulu5BX6aWSRIr7k=;
	b=Ojzr0M2ov32Z4OLy8dTwVEUKllWCY9NuYvDDn4gYowZY/sAb1BRKT8jdYDwXB1v8ZUx9
	 /sYrnX54LDe/0AJq+G5UHEMPVG0qV34Jw5QvUx6wxHORsQ471oFwTAqR97Hs6tIIiffCX
	 f6q40bjBBHj40ipv+FJWep7sqPbx4Rvw0ZsuuhZT6XyyMGZKCoaGLIQxoFmWGONcpJTGr
	 BGR9gSlFaMoRMQgcdFPDGOd0o8TTmIhMK0TladIjDfT3A1BhGwGMKsPSgYclG57Kq9tL5
	 j588mOGvveaf9zywpbpK3irbB5kWpidNL6BeEXg6CakMMnfmcltpDafixc7EyfTCLwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1mOwNnX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 08E8B606A329;
	Tue, 27 Oct 2026 20:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1mOwNnX
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1F4551F01828;
	Tue, 27 Oct 2026 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793133284;
	bh=hNorLwJ99xn/nj+HoxN7hSYWomO5ulu5BX6aWSRIr7k=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=l1mOwNnXbRuFY5GEB/rt/mPJDXGuhByASg+4tnSY28A50UldbCmySCYB0IaJZhnjf
	 XtwwjwFI2/AfT6cmdijuZ2MfPY1CoGkJzbg23De9NYzx2c9sf5JAwmCbt4m4tN2BxH
	 7JCd9srMUFxFg06aaF8iedfVVtb0ftpCgJplyBBfJlNt8pnTUOChnY6OcfUyxixZmD
	 /8Ha/DXOKOiFy/rBtSv+fHAc/A8rjCdjTANdlKA352750S84kIp94/XHXufztcVkxM
	 k6s58VM/3JnphSKkpCAMawfVZ2S+ELXhxGCcXtQQzVRy0K49FdcXzNpRPnt1g36eEy
	 sNKOKL2972m6A==
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
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
Date: Tue, 27 Oct 2026 21:22:44 +0100
Message-Id: <179313256476.2881498.3865128683953782646.b4-reply@b4>
X-Mailer: b4 0.17-dev-1f2f7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=xW30oCJ+te/Q2Tkeg2ur/hJ1H5BjBROEgOw5NAxp/aI=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBq4QgVJYezIf4OVYbIFrlN/LRrzXGNBAp884z48
 Yv9tHTUoRGJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCauEIFQAKCRAHUgpwFiYS
 aRtdD/9/IV+5o4mA+iHU1C33WMrxoTs9Do+sbHgAGViM0LJ2N4S+i8zvbUl//3LRj1bV6MgtYNW
 DayZ4DFPlYtgD4KmmdKg9of1vmRv3Fu0PkBS8FCVi56+zpx9n8Kp87nL6fS4iilXGrvl6joLE0r
 rWQXoazVD89Eov/NJP3sa052xb5o924P5orsMeN1ZHqA9tDL2R2PLihFTOt3vpprXttvE1g/NBz
 4+TnPJYA8w98UuUqQeSv2/pOc7YpBfepBFzqvAMJRPpPAvpgodNl3+vxh6uoSSOG33pUF+Xdzpm
 oIXsek9+ZhXScKoVKONfHcGwLPmA6O2oAhzwl3qMS2qL6/+LCzrwksp8V0KpOuUQLRIuj9g22Mf
 pkpXcpGDS/TCHgnVlNSJ29HjOkcALiuOHyZn3ZOtPxAdhkiJTxNcW9xP/PwJ5gzC5VRLajMd9jd
 B2ge7hNEzqf87PalBkwsJQ1O47jmtkUpTnvfPvDbkeH5nqJGeSOAL0VnKYSKqstp+n2FnShwVUC
 pou2eVHBLTOefZM0s2mwN4J7OR6DCiuu02iKtfOLb3rzbp3UkhwxvbTXOs9tC7/ZuilT1LqNGFx
 cPJP/8m6g7hp1xlBcRWWknLMw3IUouIrT4KD/AXW9vieLL9voCB0TDyByAXioye4WbeRbFSfcqX
 uqqEfsiELJUl2Hw==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On 2026-07-08 15:56 +0200, Thomas Weißschuh wrote:
> Finding the debug version of the vDSO is not trivial as there is no common
> scheme where it is placed. That's especially problematic for CI testing.
> 
> The vDSO futex unlock mechanism requires for testing to have access to the
> inner labels of the unlock assembly, which are only accessible via the
> debug so.
> 
> Also for general debugging purposes it's convenient to have access to the
> debug vDSO at a well defined place.
> 
> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> regular 'make vdso_install' layout, including build-id symlinks to find
> the correct file for each process.
> 
> The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.
> 
> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> explicit dependency to avoid errors due to concurrent builds.
> 
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile            | 33 ++++++++++++++++++++++++++++++++-
>  arch/x86/Makefile   |  3 +++
>  init/Kconfig        | 10 ++++++++++
>  kernel/Makefile     |  1 +
>  kernel/vdso_debug.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 89 insertions(+), 1 deletion(-)
> 

This seems to have fallen through the cracks; shall it be considered for
kbuild-7.5?

-- 
Nicolas

