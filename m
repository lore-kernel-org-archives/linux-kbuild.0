Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0EC2F8EBD;
	Fri,  8 May 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778241694; cv=none; b=e7OvpTLu85X4e3Qy0jExN4XuPQDm/ZbIPje5cFSaajuE3pfg4DrhQCPmkJM1IVPqbcbBvt8Uh1hOx9uHRlSlDGzrdOIJhwHDIEqgte8fkBF9/H9olKEyty4rBYKsIDWnty2iA4cqkbtQvxZEOPhSHEWZoTCMr/dGXyq9TIhOTsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778241694; c=relaxed/simple;
	bh=9NM31fO9FQd5RvWwX3TjoTL03VPMKiocGJpXCMGBsIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR5GY3e2RJzUVtleEJgrjFIxOKlmLLklWK+gCB8CZjP9EPMh0GHBjzqrLMG9S4bOsEaABquG6JIY5cXbmWRyeQWRPXmYCJfHgTl+9hA7nmri0BHuXC6I3fcq05WCEitYSPS2skjPco2VHLmP5pXGwFUMQqEJtPriijL0+AggiTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpIlZRtE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpIlZRtE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915B5C2BCB0;
	Fri,  8 May 2026 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778241694;
	bh=9NM31fO9FQd5RvWwX3TjoTL03VPMKiocGJpXCMGBsIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpIlZRtEy83sF5zf875hz1cRT5zIi79LuYwN9mwADz1IrQ3pcn8fcVTBBz+r7o/zX
	 dwAO942NRqSYE1diAbeoWcyESoEdzr5NzjgfcGD9DNcCXpc47QaDdJaNZbwuN/XvEW
	 rE6HB0GH2qc6Pwlv5+mxN1PvyQ7BR8dhchA2ddH+SxG7XXO0RYVgQk+yPxXYD/qttC
	 Pkeyq33j21YPwmh1CcXBXRdLB+XXXjoVCu73D9wy9z2dpzM+L6o0mAAo4IwV28MxXC
	 KF63VgtwAPS7qqw4HyCOkaz46m8azcp/1r24r6LigJbAs9JrQrjVGfV/RqzmxIQKtx
	 +ia3xZjyB0T9Q==
Date: Fri, 8 May 2026 20:01:30 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: Jill Ravaliya <jillravaliya@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in
 builddeb
Message-ID: <20260508120130.GA1145220@ax162>
References: <20260508102713.27678-1-jillravaliya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508102713.27678-1-jillravaliya@gmail.com>

Hi Jill,

On Fri, May 08, 2026 at 03:57:08PM +0530, Jill Ravaliya wrote:
> Just following up on the v3 patch I sent on May 1st.
> Wanted to make sure it did not get lost.
> 
> Happy to make any further changes if needed.

Nope, it did not get lost, it is still in my review queue. I am just on
vacation for another week or so, so I am not picking up any patches
until I am back to properly test, review, and respond to -next
regression reports. If I haven't responded by May 22, feel free to ping
me again.

-- 
Cheers,
Nathan
