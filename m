Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863919;
	b=XD7fv3GT3WDnYJrL7XEYA9OTqQJArfdsUggfRn931AnftyraMtnf1kKOGtVsXQGn5chY
	 p56WNrYUgXeuqttSttfvd4sg8bvaDtTKDEvRv1HsJDBzK+9msR+LK73jHrntMlK0SFR7c
	 TqddM32XwCG1kSmMHTZEG3vEjpd9U3ODfIqwNC8P95z5BNO1Di8IojDVc6sH8f11XYmIu
	 KDYEuvYYPfTKshZ/SgymTvbFJ1KNwIILnLxROJ7V6x3u8hOE15RycKpAT6oHFNZF+GBJG
	 PfvwwjjvuwIrqsW4H/sLwOUKMcS4iWLy5SD81OYq16UAeyDMf/cn3JfOeH+zscZH8TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863919;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Txl2DuZORzY6/jtbDNMK/vbKvF+eBvFTcs7LTnpUoio=;
	b=x1PtRc8EimyXLSjAtfYulAcj7gb0TP46qKjO+/1RW6geRWlHv0K9rZqZv98HcD3ukQ5m
	 V3EUaEZ4AlioDLvz/B82E+TNkiKflk2YpWMjC24bwarX8L8VxcoC0J/HET+hQuYzMkvBN
	 tAxTjS17bn/u1Y1QNRTtRNvcX1ohRFHWdxJoi+FbGJZPou/jtrvQImWDiYKX7AYIZlI22
	 xnVxv5jV4E1N4OSdhWW0yxKEetZN5bGKb6y3C7absJsAfjHTAPnYuhZAC4RPX7YXQ7m0u
	 2TwOh6wHRYrQTVLW3YrWS/pqv6Vr8a9dtIVMx/dvTx85knTSBAsKAOx/GWM/qa6Djqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hG4xoOwg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10904606A32F;
	Thu,  5 Nov 2026 07:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hG4xoOwg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE09D1F00A16;
	Thu,  5 Nov 2026 07:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863918;
	bh=Txl2DuZORzY6/jtbDNMK/vbKvF+eBvFTcs7LTnpUoio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hG4xoOwgwPYhlWtawN1+E6o/Sg3xZiY5fMfl7zRRWwpvR/pkjqzCRbiwoMqV+ojoC
	 jKgOxw7KeLGEk51oJRI7LBA03ZsiNGz2/3CHFXvon85a7Ab5MRmPGnbBQnOqVIoDZ3
	 Mi08O5QKWGqCAMePD9xXBY94vs0WUxUjEdo+KzHTUyXjxsEfBIHMkaF+Oho58NdbTw
	 p/njWG6sPf9lMaIJwbleiMjPhsiItVbPW91Kg5OyO/hVwVQoYzSdSvRKO8KYezpPu8
	 JPzfz58kiCmRgT4VewxsN6Y/VbPs9Y6NCN0bSFYBUaSzzxFMt9Sf91NIp7hBBvwsh1
	 zUTYqwlPcyFzg==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: fix use-after-free when a variable refers to itself
Date: Thu,  5 Nov 2026 08:31:41 +0100
Message-ID: <179386358246.407677.3176167647395624497.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008164504.3683811-1-lzsx618@gmail.com>
References: <20261008164504.3683811-1-lzsx618@gmail.com>
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

On Thu, 08 Oct 2026 11:45:04 -0500, Leizhen Zhang wrote:
> For a simply expanded variable, variable_add() frees the old value of an
> existing variable (or allocates a new variable with an uninitialized
> value) before expanding the right-hand side. If the right-hand side
> refers to the variable itself, which is a common idiom in Makefiles,
> e.g.
> 
>   X := 1
>   X := $(X) 2
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kconfig: fix use-after-free when a variable refers to itself
      https://git.kernel.org/kbuild/c/3910d22d

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas

