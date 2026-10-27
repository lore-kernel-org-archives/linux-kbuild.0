Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793131030;
	b=VuowNnOeI6p0OicDA5Z0keEZoCkoAMfigzn//agC8faEwo/tBaRfOV7+dZcaNO5yiYIy
	 yQPKMeqRLC+/5XIKHdZ5ip2DPXKOATzQXPHDsZAARm2ESquhD+9FdfC4Z90uDk2MIdHm8
	 znmxEJBgaT4UImMsMNaC/vic/nusGIE8z8R72S6H1YHlbdZUlnMqEH8IzvWGRSJASI/EK
	 +xeBV9EvZjt6c94YERJkydlUJE7q3mBWcuL+l8Dt/ULg4E2Zq9xJj4Ao57G/TPcAu5Aju
	 Y9PotakQWaJEE15t9ejm2XBoKBfMOj1kH8YkbRV8WVS2Jc9fn8Eiqq+Q/yp72vS0H1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131030;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SMyYRELwwZeuNtf75MqiN2auLAIDD43sZyC7A/iNGsw=;
	b=BuSD2pKycqRSOqzpR8n5lCHBjR7eHIXuIAX3Pia8EP1JLj28iOw59z67EqMAmkwQeW66
	 //uFKejPyvyTC5GcRUIeDlt3dfGT7DFa1pATy/8xAPL0JF+IcObdydvU+GXbrX9yTLX5+
	 WWdrG9xRzo26949IxlqNLOaP8NyC2BglnrV2MzZzuxvyDrxFUwONP86IaRa64Be7frtEJ
	 ITOA0XDiNhLrzQ8dYid5HA1qKn4jFyQg6KhVsVmvUXNat/wQFePO4TePgOzn7xKfvnGnw
	 MfVmt05DpuKv8vSVUoErCEw3f0a591ct+8TfWBl5dg/+36ZBy2TEnFCpI7jUEM5fJ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jg+NOm3N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6B57C606A31A;
	Tue, 27 Oct 2026 19:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jg+NOm3N
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 79E921F01825;
	Tue, 27 Oct 2026 19:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793131030;
	bh=SMyYRELwwZeuNtf75MqiN2auLAIDD43sZyC7A/iNGsw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Jg+NOm3NonJ+1pwcdujNDEUphnXbNbeMaWqRlog3XTofahqPpgPGEzQTdY92oIFsx
	 n2FtmqsFPsPUqChTyGD25MKZq5srkpzF3iA7UHZsyaPeXhdm4JaW9kpIHRSimRnBBq
	 fIQfwRO7cI7hAsg1KW1ELq1k7y4MWcQQbU22P6Jx92fEJXmUEvJp7RnaaPQDqjORCM
	 1u29st7OSVJ5Hg2b8UEdvjpZ3/6+6wgMXifrmgycmXe+KZ5ci54UVMWbSU5uGE+7Zb
	 ZlLkAD8pUHeTq4dJTHM0mCoKYUVy57QN89VWXynLYiU+w8BjckxT8TU5Bdsi5p0bVS
	 DcvyDQdnUxEuQ==
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
Subject: Re: [PATCH v2 2/2] kbuild: deb-pkg: allow to set package name
 version
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025-deb-pkg-v2-2-8c33a4ac18ad@sigxcpu.org>
References: <20261025-deb-pkg-v2-0-8c33a4ac18ad@sigxcpu.org>
 <20261025-deb-pkg-v2-2-8c33a4ac18ad@sigxcpu.org>
Date: Tue, 27 Oct 2026 20:56:46 +0100
Message-Id: <179313100619.2748903.16873015602757150534.b4-review@b4>
X-Mailer: b4 0.17-dev-1f2f7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=99wo308cdK0dLGZ9mfeJZPwugDlMcpNk+LvnB8KtqVw=;
 b=kA0DAAoBB1IKcBYmEmkByyZiAGrhAgKhV0unOAgkjQGy4O4u+Pd3Cjo3+LWyWbI/arWAionwp
 YkCMwQAAQoAHRYhBIdBN6eHNySngb7CxgdSCnAWJhJpBQJq4QICAAoJEAdSCnAWJhJparoP+wWk
 VGMnrFM6VIZkNFuRLZocW1ALg5mBCG8keX1JAfaLQ0d/Xm2Bi23OK9KwRjq3YqpYJyC+jTjqNaa
 X5BjXz2oSGPGamZt3e0QLSFybGWMF3ubEmBEnQN38iVCAh1/deIHKgEDULwAYmgrBGwQ4q6X91X
 7pTzug5OBn+9m0k+CoJvi41XHVondCbiJTlsddouJ3cU+2b5yU2PacZrqpYjchNo1v5z/WoaeNp
 B6v+JAcIAVjbL0GFWtEYd9+pNGH0bZ7cTPY37nvkkPFJfn8LP6PDK6dBbnQTqB1uDT1VfoR7gAO
 8LqzJgWjUqL4u74qWLbmCDZO4qVtvcznyGVIJ/EGTgIn8SuB18T+GvT3Z8nnqv9+9n0ri8qF5AA
 WMiVzAJ9s+U9su56ZiFMTbtM2kc/ZB/adOsxBERb0BHNoua695bXa+XPfQJmeo8HgjXASJE4Fjc
 5nq725Fv683/MKnQ2peiU0MWhGKZX5PwRzCPv2bwMEijzJWo6uj/aoQ9PgnLL+73JW6EnygWDGJ
 C1K17AH5zF+ylQZOgeOYYtq6SBUvVn6MkumxgqhCistWWF/mHuWvxuVtSYredFJVgl1AUcxLApx
 kyLopzSMIBcaJGXMcQZTlcmCQr2RKERuy/zouQ9oMCnE0eQQP7Gjt2BeBeTwnoGe5CYRaQbRMxn
 ck4zh
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> Instead of hardcoding ${KERNELRELEASE} in the package name allow
> the user to override this.
> 
> This can be useful if one doesn't want to accumulate different packages
> for every commit or micro version bump by setting
> KDEB_PKGNAMEVERSION=7.3 or even KDEB_PKGNAMEVERSION=stable.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index d4b007b38a47..44ca9991fd6f 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -172,6 +172,12 @@ else
>  	packagename=linux-image
>  fi
>  
> +if [ "${KDEB_PKGNAMEVERSION:+set}" ]; then
> +	packagenameversion=$KDEB_PKGNAMEVERSION
> +else
> +	packagenameversion=$KERNELRELEASE
> +fi
> +
>  debarch=
>  set_debarch
>  
> @@ -215,7 +221,7 @@ Build-Depends-Arch: bc, bison, flex,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/
>  
> -Package: $packagename-${KERNELRELEASE}
> +Package: $packagename-${packagenameversion}
>  Architecture: $debarch
>  Description: Linux kernel, version ${KERNELRELEASE}
>   This package contains the Linux kernel, modules and corresponding other

For completeness, I'd like to have something like

    Conflicts: linux-image-${KERNELRELEASE}
    Replaces: linux-image-${KERNELRELEASE}

here (and similar below), if ${KERNELRELEASE} != ${packagenameversion};
but probably it's not worth the effort.

I'll queue this patch set for 7.5, thanks!

-- 
Nicolas

