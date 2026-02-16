Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3894727055D;
	Mon, 16 Feb 2026 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242152; cv=none; b=oBkacmkGn5VovF4vs/RN28EXrITmBVCZN4BeniSQHkWgSJJMQa0Tc4qme2vxtWkU/tfDJ2Q0Fxjv8cyTqS8KfwaMl2Zhd24V7WI1NQ4xZQXbWsBSYwPP21nShTr7loMdw7Q+nwbweY7b2hmixb9XDpQvMmxOX+cIeum2tAH0kXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242152; c=relaxed/simple;
	bh=Qx+31xXss3wDM1nInZOJ0M/8jEm5MlSdby4C9beFIfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbQ/1XWRI9tUeqeRjGmn7yWCD5hIDP8dqB/QUm9WEIc3EL6dG1a8R2igDJ3rvzBQKme/GEIXhH8OCpcE4xjmRplJadrttWn247FWPJcr16YgJuS4iEaqqriOGYkpZyoJWkqefJUpCyoNsJkfZqB8QDqW6blDcWQWNyBfslMhUOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+UobP0H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+UobP0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA2FC116C6;
	Mon, 16 Feb 2026 11:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771242151;
	bh=Qx+31xXss3wDM1nInZOJ0M/8jEm5MlSdby4C9beFIfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+UobP0HGdLyHcZpBnEe64ITgmrdp2Ro1uGK3FvCTnrTYVvWuoiHx7yGiOBswplOb
	 E+mzODRkv+mlRPDVHY471u4jqR0+Nxhrsp8m9MmUc+duAcGYtnZ6XgmBnhIJS2wIJ5
	 /vC2tCCGnUIEV3zjsCA9z6Z9ms9LQyglThJkeiGVsCZ4F5FZTFTrlIiN4wA84DjRaX
	 9fYiJCGz2c5e5ytaV840soJ+WeWSXr1hixbimtQNb8DTYwLrXDyYByFTR6/eyab2sN
	 PBa8KOAo4sZumhPYPc33WNlYnXtWYrROCTZ+VMS9KemNDZI6gG0sIxyhe/Y9XOhMgl
	 iaZRTpYhR8PaQ==
Date: Mon, 16 Feb 2026 06:42:27 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Steve French <smfrench@gmail.com>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
Message-ID: <20260216114227.GA213868@ax162>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
 <aY8wyR572eZYWVJY@sgarzare-redhat>
 <20260213191138.GA2131983@ax162>
 <CAGxU2F7FFNgb781_A7a1oL63n9Oy8wsyWceKhUpeZ6mLk=focw@mail.gmail.com>
 <20260215212901.GA695045@ax162>
 <aZLTsduMY7H-QoA2@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZLTsduMY7H-QoA2@sgarzare-redhat>

On Mon, Feb 16, 2026 at 09:25:25AM +0100, Stefano Garzarella wrote:
> Oh, yeah, I just tried the following change on top of commit cee73b1e840c
> ("Merge tag 'riscv-for-linus-7.0-mw1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux"), so without this
> series applied:
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 0f1c8de1bd95..86ca327ebccf 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -50,6 +50,7 @@ against the %{version} kernel package.
>  %if %{with_debuginfo}
>  %package debuginfo
>  Summary: Debug information package for the Linux kernel
> +AutoReqProv: no
>  %description debuginfo
>  This package provides debug information for the kernel image and modules from the
>  %{version} package.
> 
> And I'm able to generate RPMs too without errors!

Great, thanks for confirming! Does it still work with:

  AutoReq: 0
  AutoProv: 1

as I notice that is what the %_debuginfo_template in /usr/lib/rpm/macros
uses by default. I suspect that the automatic requires is where things
explodes and I think we do want the automatic provides because I believe
that is how the "this package provides this debug build ID" generation
happens.

Cheers,
Nathan
