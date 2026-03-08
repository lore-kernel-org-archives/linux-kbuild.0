Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B83B1F5842;
	Mon,  9 Mar 2026 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773037886; cv=none; b=tzTB2S18HA7AFKJ0zNpR10RKjoM5yx7vLEbJI4KTZzar7a/pfLsQbyMHfW6QPRNFI7/aYMh1fn0f1/hOGD2eGN8O4PgM5ySv9V+lt5IPZF6QJCqBK7rdzdD52hyYd/HuGmRtLODkqAafDS94EYfv/D3a11GwS78ulFBIjP+79SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773037886; c=relaxed/simple;
	bh=Md7FYDF0w0VZP0pjjopzG1vimebwfHL4OaTwloH16PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0Vem8FmtFh9vuC/46tNibFiA3McHXHzSbbziNnYfzGVlQ7QuvVvfR0qVzcH6Y7mh4hozpXtP6oyhaa94WIzfwbuqYoz+kOKfais+C9KhfCWQcPlE3GqLpnY4U3dCm8fxysispX+ZZaINepL20z2WInE0CunMD33nlxUwJRp9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S14DCksv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S14DCksv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770C6C4CEF7;
	Mon,  9 Mar 2026 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773037886;
	bh=Md7FYDF0w0VZP0pjjopzG1vimebwfHL4OaTwloH16PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S14DCksvGQOfBloqfu/+fNf4C6+KbIzSgfYDS6B5nwtaQFIBZ20KjmcW+a9cVxf8t
	 YlmJV1RnCzzUIvfcJq5ywVFriJ52lgLmSSOdRuUeNyd+UP18fRlWa0yuNHcnN1cKgH
	 TNCrhDZztboMqgCX5RBQ4aVUy0EqIHDT+EUfCUoV2mbDHsfbGhrTr3URW/hkGxIpLI
	 5SALGigzx+laS7a8uSOkxaR/AF6U6YgXzmcbo0ipKxv7Qjno9/ajoNzMIYzqzLaLl3
	 sAQpNrwEId6T8yPjPKsfMgZR9HgDD74ccA3I5yJOJhWG1aEdTlvrsKv0M9GuLQf0+t
	 v1OjB7vNCHhiw==
Date: Sun, 8 Mar 2026 07:34:23 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Delete .builtin-dtbs.S when running make clean
Message-ID: <aa0Yb18ifgNCmdgl@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, stable@vger.kernel.org
References: <20260308044338.181403-1-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308044338.181403-1-cmirabil@redhat.com>

On Sat, Mar 07, 2026 at 11:43:30PM -0500, Charles Mirabile wrote:
> The makefile tries to delete a file named ".builtin-dtb.S" but the file
> created by scripts/Makefile.vmlinux is actually called ".builtin-dtbs.S".
> 
> Fixes: 654102df2ac2a ("kbuild: add generic support for built-in boot DTBs")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Nice catch, thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
