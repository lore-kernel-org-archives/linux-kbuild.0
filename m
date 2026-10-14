Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4CC1E0DE8;
	Wed, 14 Oct 2026 21:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014049; cv=none; b=io2atN7AqtXIKgO3gb4JxLU3HsA/ci2/Vfbt3xoSSnrIqvtuKmZILR6+tn6zgnDKf+GrA/EjGzhcgxtLLaZY11nxDxmlV3kvyEY8fVTLdWDLmJLqXMD7xmqVp2DMC5AZfdH7q/Ed+JPQmLKsZ+p+5n3Xd7vhBb3f6YdvQ0bh3TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014049; c=relaxed/simple;
	bh=yqU9kq1HzxGNtnMqM/SgyTSWmIe0yPibKoz4H25rPXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtHB59hHzSLvLHSx41uCHi7/nNUskLKy/k9Y7fRHE7yCG1IGt7j+3OcZCzNTXKbEaq45qf+cSyjLVGsrpur3aQ+hPbvPV2QMpu51aBMZvix5m5JOnLesBzW9GBewxN2OyTs5U3yhiiYmbPmm9V5zPTXnVnrqxSRJL/oiAsCXDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gu5m99Hj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu5m99Hj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B306E1F000C4;
	Wed, 14 Oct 2026 21:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014048;
	bh=3pf8Tds7TdMOgawC5EMHd3j5MJVpojAEEXnxD5jBgFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gu5m99HjhsPZbZ1Om41CDxpMuZb/Su89/EEmL8VifYOn1IIOftU9Rmp6XtHlu9l5j
	 iUVJFTGU+UbB6DdLjCIXUrpQKiOp3Ro2AA3HoyxuEO75uE7HuoFZ3X2x4l2HCYBWRX
	 D4u+hB66Rh2GTN15V7mKAMCDQZX9lzMXMOyriQ5NY6e4MROWfVMBI7SXY5zxZHTJlO
	 H0WWuMn6DAcmzPJxOwairX1YgG7p3f2mQEvAYfpVVFjHn44tx2bmUeMwmVWCwEohXn
	 oQhN+FG2IjCmLK1Enfj0YE8rBaqQZ3x8MI4Odpw2jC3nwfL41y78v3k9NPej8vhwcE
	 RhyH4OjSobgGg==
Date: Wed, 14 Oct 2026 14:40:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC] kbuild: enable pipefail for commands where possible
Message-ID: <20261014214043.GA3380464@ax162>
References: <20261014-kbuild-error-propagation-v1-1-573adaa0a076@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014-kbuild-error-propagation-v1-1-573adaa0a076@linutronix.de>

On Wed, Oct 14, 2026 at 10:30:30AM +0200, Thomas Weiﬂschuh wrote:
> The exit status of a shell pipeline by default only depends on the exit
> status of its last command. If an earlier command fails this is silently
> ignored. In this case the build continues operating on intermediate
> state, potentially leading to confusing follow-up failures.
> 
> The 'pipefail' option can be used to exit the pipeline with an error as
> soon as a single of its command fails which 'set -e' will elevate to
> error exit of the whole command.
> 
> 'pipefail' has been only standardized in POSIX 2024, but it is supported
> by many shells anyways, including bash and dash. To avoid issues with
> shells not implementing it, ignore failures silently.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202610131613.BpOi6VPp-lkp@intel.com/
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

This is probably the right thing to do but it makes me nervous. pipefail
is very easy to hold wrong mainly because of SIGPIPE:

  $ cat test.sh
  set -o pipefail

  yes | head -n +50

  $ bash test.sh
  ...

  $ echo $?
  141

and debugging that is unlikely to be obvious (but maybe it will because
the error would be 141).

> ---
>  scripts/Kbuild.include | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 8c311b997e24..1975d2739cdb 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -149,8 +149,11 @@ delete-on-interrupt = \
>  		$(foreach sig, HUP INT QUIT TERM PIPE, \
>  			trap 'rm -f $@; trap - $(sig); kill -s $(sig) $$$$' $(sig);))
>  
> +# try to enable pipefail
> +try-pipefail = set -o pipefail || true 2>/dev/null
> +
>  # print and execute commands
> -cmd = @$(if $(cmd_$(1)),set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1)),:)
> +cmd = @$(if $(cmd_$(1)),$(try-pipefail); set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1)),:)
>  
>  ###
>  # if_changed      - execute command if any prerequisite is newer than
> 
> ---
> base-commit: 27286bf096c51df05eec6664f18b945f8dd61c0e
> change-id: 20261013-kbuild-error-propagation-8ab5f649ff36
> 
> Best regards,
> --  
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 

-- 
Cheers,
Nathan
