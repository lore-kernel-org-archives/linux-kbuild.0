Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793131032;
	b=wTe73hPGN8ltyjulGP94mMaIU4hFmd4vGoI+483xckMzuDdZuGvxEV4jpbgt3JMyOpiw
	 4EKjdNzRUzeY0EE15rDaPBGYr8lVQ9vyhd8Ykw2yqiVMees+Do9CkyiS6ELFi4XS7pe9F
	 mtgygAjpGXptNPC0N+iH65i/wEDYb3wR6O2Os/MVX8f/RHgLBgU1c9DmzuUATVX1x486K
	 ZnYNwDiHUcMo6A9al2SdOcF436Gh4AWfE47LVFkwNr69KNWWRO4cmn5lw3bffrqsjxuXL
	 UlJIHtl1xkeEo4ikDK/Z/f8oKH53QF1o2KoNGGxFgGmfWaNagZE51yindn4IiEd95Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131032;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oKyvpN950FYQ1dxknA8Nosz8zZ++iBn1FVU8K7fGO+w=;
	b=gkVabAj7snh4bLlM8UJupPzH2veMkrfMMivW5C96qXyS5t2DQJ+UZ8P6shEOqRmPfMZY
	 rAmQx5kxrff2XzP3wTC/6PFDIj70p6bwoQHauEyBRd464exC3kDdz+0rChXMcm+m4dY5a
	 yTH9GUpBRciYm5fAlHPG22FYRPcqOmQELx+5aulcJCOuMzQAFAzBzb4QKAv9OBRa/T6em
	 e9TZ5NKLaa113bzTk3ZaapfuQPsrhmtcSpJgOa6cLXMV5gshrMQLO1duFijea3T/3q4nL
	 W2oVOAKako03S6ls0DK8k6cBIIIDyCLKFi4Wi9KlJdUBlpFZfP59nCEZ021afRIpxtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHX6zkmr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 69A01606A32A;
	Tue, 27 Oct 2026 19:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHX6zkmr
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C7EDE1F01825;
	Tue, 27 Oct 2026 19:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793131032;
	bh=oKyvpN950FYQ1dxknA8Nosz8zZ++iBn1FVU8K7fGO+w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XHX6zkmryWSCoiQ/31tvFdRN/K8ZbtTOK4Xhvso+hUN3R6SgGr5xq1akfeLrTa7F1
	 1Kjd2p1QUrvoHKH2JPsahRJc95LoD/gaRv3xwijztY1aE2s09lJfFrcRPdjzqoUQZo
	 Eug0PqFWCPaQ4z2yfLRIaHnsn9IYW713cR48Z/P5XAoZhudNeoabMoY1MnOcvmu8Ke
	 DBE4geHSh4BQ/pKXJTyYb42OBrglJyhULGKuiZtQO8wLpHDZb7icdek0qOAvjEp6SL
	 yGdP/zG0TjKeh/ZgfqAaFtygNlY4Pk0nlj9WLcmIBL6Q8JksQKm8rZ8Iygr9aPjPbT
	 2/AacGSMCuWBw==
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
Subject: Re: [PATCH v2 1/2] kbuild: builddeb: Use ${KERNELRELEASE}
 consistently
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025-deb-pkg-v2-1-8c33a4ac18ad@sigxcpu.org>
References: <20261025-deb-pkg-v2-0-8c33a4ac18ad@sigxcpu.org>
 <20261025-deb-pkg-v2-1-8c33a4ac18ad@sigxcpu.org>
Date: Tue, 27 Oct 2026 20:56:46 +0100
Message-Id: <179313100618.2748903.6657862004912569904.b4-review@b4>
X-Mailer: b4 0.17-dev-1f2f7
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=evSiVBSLfOzXLwI/0bera8Tsig5HTdgE8IFrlsV3lJU=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBq4QIBMgevJcq18z6IyLHpQwXIA5JKt6fOOQEui
 eeR1xdpowCJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCauECAQAKCRAHUgpwFiYS
 aUbXD/0Z5y6YgMF8UqDfllLKMx6DKzwzixQ45BU3qak7GqT3M01fAogwwnZ9WjkBJGoCDrNx77j
 2+80qWtK859wf+McBkCsY1mGHP8laApvkzVIjQdH1kCCEcb16aldH1wUx6+eSLePF6GINSUo6Cn
 4rx9VljUBr49DAdLKg3cwGR+PRrU1EZTcY+Fw7VJyCpHlDm2sZ0K3ONeO+jBf8yAin7nWxmjn3b
 zZ8w2qoNcdAeYQHuF7yJ4onNNyGyB/WzodLf//yQ7jBiSHJ6TQNx8aTvsq2VoanOEkevY7MRARd
 5tvhV5vKAYAx0I0gd2iZAMJZsOa/Uo28T702P+Gj+GjA8I5n3syNqp/UrQTPO7f7LXwq0LiRP8O
 Cl+0uCWV3TEYkxUDIWiPDPzgbbc9OGmnzMXiAlMSBXV5Ap7q7ssS9EvlFz/9fDrAwFuoJvqqIBF
 FZkr4VXNHqx4StRVVgNrDEwTsEbBz/pCMwRd6xGybpiJgbbpdxoBquJ68Fn2T+ELw1eStbMRZiz
 zMxhzjXkdZrtYIY6/lDamAgHfgUW7oCvzJr4l5x7fXENavwq5vQkojGrQvSs9kWVQIINDO42VXg
 xHBD1GDmGMCsCcoawEC8ZlEASqKnRSoT0S2ZxOuuJpxJZHI4hSc90H4TqXoZit9JJlZKf1UdfhO
 tYoj+hjRF4ZnpLg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> Only use $version when it affects the package name, other places
> should use ${KERNELRELEASE}.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index ba1defc61652..5fdc9ea0dcca 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -147,8 +147,8 @@ install_kernel_headers () {
>  		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
>  	fi
>  
> -	mkdir -p $pdir/lib/modules/$version/
> -	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
> +	mkdir -p $pdir/lib/modules/${KERNELRELEASE}/
> +	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/${KERNELRELEASE}/build

yeah, well.  I am afraid, that this may lead to non-obvious conflicts
between packages, if KDEB_PKGNAMEVERSION is used with badly chosen
values.  But as KDEB_PKGNAMEVERSION is not (yet) advertised in the
documentation, I think it's ok for now.

-- 
Nicolas

