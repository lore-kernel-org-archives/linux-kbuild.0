Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D0B37CD52;
	Mon, 27 Apr 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777322941; cv=none; b=cALJLpPMldA9QHmev/qoNmSMhGu1vQ+zKaRdB0/c/lXdQVnEdtSLlYGupwKEhBC5CcuNK2vTjXWhqTAJ2bITG6bzCMUIjJTKN9omOAGLSu1ZYZ7oY91F7yDIrebgbO53bluRU3eDNiMOzWWJ2iFh4+5NNJqkrwFwsyoMDcA9hBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777322941; c=relaxed/simple;
	bh=ojPO/laAlLIwApW27w8hZ2ScAeK8N4PU4Eq2J0ow4xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRuEWDYAMGbyLQCG1vjo19Ra/Z+inLQCf6Z6iCDPy3zvnk2HHvD544WoWspsZzK6IANoBEOWinkSG15cPQBFSBbcmxqNBqRD1iinfqn9lg9pdVVic3MFGIVm5nmumJvCHPnnu0fNyWiU0DzDFAoSPQ6joTpyjfjqCOna6wtU1bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KurMVD8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KurMVD8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CC8C19425;
	Mon, 27 Apr 2026 20:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777322940;
	bh=ojPO/laAlLIwApW27w8hZ2ScAeK8N4PU4Eq2J0ow4xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KurMVD8BYhGM1Nn2Jm3ENaHQRh471cksDfJRmT+PG+3W1i2jWLwjAqq8WF0FVG6u9
	 okje7ehZ6c06dlgf6L1gnSG4RwfMvHo5nj0ruxYqGtUGrQ7aAesVjIzImzrwrrNw+k
	 GgqUzZrmH1lvKyrf/00GVSjmotbSxTSTlVGs9uqQ=
Date: Mon, 27 Apr 2026 14:48:19 -0600
From: Greg KH <gregkh@linuxfoundation.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: akpm@linux-foundation.org, ljs@kernel.org, arnd@arndb.de,
	masahiroy@kernel.org, nathan@kernel.org, nsc@kernel.org,
	ojeda@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] scripts: add kconfirm
Message-ID: <2026042727-delicate-genre-21fa@gregkh>
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-2-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427174429.779474-2-julianbraha@gmail.com>

On Mon, Apr 27, 2026 at 06:44:28PM +0100, Julian Braha wrote:
> Add kconfirm into scripts/ and modify the root Makefile and
> scripts/Makefile accordingly so that it can be compiled and run with:
> `make kconfirm`
> from the root of the tree.

You don't say what this fancy new tool actually does anywhere that I can
see :(

> 
> The user is expected to have Rust with Cargo installed, and an internet
> connection on the first run to download and compile the dependencies.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  Makefile                                      |   12 +-
>  scripts/Makefile                              |    2 +-
>  scripts/kconfirm/Cargo.lock                   | 1710 +++++++++++++++++

Did you mean to check this file in?  That's not going to work well...

thanks,

greg k-h
