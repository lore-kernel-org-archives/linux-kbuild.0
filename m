Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863921;
	b=jU8yJ2iKx5i9hjQfhN8l5LHiqvAdtPAjn0mIJWI+ZJmQyvlKv6QoZ3K+VpQSrNubShXr
	 gSMJSxY3qS5jpnEYhgJ9kJlOUqvmFGBw5SAN+mLmU4CH1c2YJBgK9dmRpa0eHNJJpX630
	 0uj5RV1lqPcu7G6Ssku3Zu5Yhm7yMPG6PMXjxOrBDQ/+6lBsw7/8H2umbSEkePPKqlix+
	 D3O5SBCFRJ6PKxwX4NWu0WHSg22sCFCuEDTNr/yWOMs1KwV38SOJYKR8diszaqh7kvdZq
	 tFlMqREIb4qeGkTW5k3sqKRWxxKcER0J7AvBYEeeOtUk05xUVv/4h6cZPx9ZwjN/6fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863921;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nNMquTaCf2eH5cax1M8sNiRrK6lTVygky8NES0mPP8Q=;
	b=xQtmQfYuTXShYxAS4IuP69hmPWRGaPdFhcq1pvgPJkPIIzShBnYIzxHSrqBqJCB+Jv6e
	 EZiaXerNaB/kM+iY1lTLqm4qDfW4UQi21WVEe8NwhPit3EdKzIJj6pGTLBadPV5y+4Rv2
	 XcQPIZGY2jcj9H81RJa5RJ00IZSXUPJjF7048KK5dyoyj2/tI9JZOQ+QEz9GDZUrczfSK
	 ERTNNfH1yQzhUYb7mMUzU3u/1I9Cj6tyOYAo3cWn8ZI3kXrcOux+rlJtR1P+hvk+wB6CR
	 NXnUjN77ns5RKk0FOsefTKXtPpZ8ky2XcbbJzSfGPHApA4f9Faz8sFKc169N78J9QGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JamSNmHT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8222E606D805;
	Thu,  5 Nov 2026 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JamSNmHT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910A01F000C1;
	Thu,  5 Nov 2026 07:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863921;
	bh=nNMquTaCf2eH5cax1M8sNiRrK6lTVygky8NES0mPP8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JamSNmHTa1lLloZPtruk/Q1zu+WCMkTC68up/kdnsIsPWpaoYDlFDc0mYahbuPRo3
	 lQwoAQCyKOkoCmklD7WKq76vpTgk0GnK21G7a6nzbYjr8b7gfuVgDe1qG5cylrq2yb
	 OPWy6bgIVyc5jQqJuFeMXu+gvWz4BTAjxM6AZT2XOaI3xT7DBfZ0l3wlpfTUxNeczk
	 5Bh8caNdNYy/bWqrFZLzbL7+/smSMGbfx0cv8+2JjEXsr7FHDxLd8kMtvItcbs562P
	 PXF0irBKIWQo9qYeWIHmvUm+4+6drE6QwX6XCCbjMrUGtgeFhIblBvTWeTVAWner2E
	 mjHgnACZ0ReRA==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kbuild@vger.kernel.org,
	Zuo An <zuoan.penguin@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3] kconfig: show number of search results in search UI
Date: Thu,  5 Nov 2026 08:31:42 +0100
Message-ID: <179386358245.407677.17026866694779512181.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <asvB7fchdB8lUkMc@gmail.com>
References: <asvB7fchdB8lUkMc@gmail.com>
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

On Sun, 11 Oct 2026 17:05:49 +0000, Zuo An wrote:
> When searching for config symbols, the search results popup
> will now display a count of the results in the title bar,
> e.g. "Search Results (42)". This helps the user to gauge the
> number of matches quickly and refine their search if necessary,
> instead of having to scroll down by an indefinite amount (especially
> for nconfig's UI).
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kconfig: show number of search results in search UI
      https://git.kernel.org/kbuild/c/f57c1b71

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

