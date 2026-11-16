Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817929;
	b=3d8zDSLZpId7iy7QmTS/sjswQV66ytdx0aNde6wVWwnJrB7v7OjEfo+SP808+HHXpFJJ
	 O3sYUtqMhEN7nyHcwEsH6IuhVjjJjHIvikfn+7mr9DG4KCE6v6x970ysAzDtlHSIceU2p
	 Fsjd5nwSYXPBO02ysRnyRADw9HhGIMY68x8gBaOllz/Suw00tEVPS+A2btkaHP0y2LlyG
	 l8SsPvKYI+iAy5AmkM26Ca166CUXryh9Qjmiy8t9WqfyFNY3iaLCCi+fsafRV3Ho9sIy7
	 GK74HviNWk/H4cOqP8mmf6ehVkGrIqr8lJNSiwptacIPLAj2dxruzqDZgo03bTPnTzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817929;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=FOaaLcXypvRxpjlgQdCsx2GFSz0rpiQmt2LrucvpSSg=;
	b=jO2HqavaR4v22EqZPD+/DKEY3WALuxgAMf8T8KLAlBG4nEE53TRuXE8EWpzRNkX5EmxA
	 CTVxdd0KYnW93TTjaN8PpNxxpp1/kKiFX6n1+qggGw88FuuwE/f47dnpMfNrQOOhT5q/Q
	 aH8sVDgpeTBCoPum3iHBCAKIjDH5dQHNK0GlLidQvhwIMPOKk0+POduRSrT596OdjE82M
	 isoIZ4XxCTIB95KDNyUyk4FF+v82V+TYJts4mf0FdjrVPEcxiZuhkUlK8d1m3eMEgh4R6
	 fA9WFoIw2Ntz8eYqXG5kYJYhzwuoBY39M2Q4pMoBTyX1tDhv6QnvtahD7wIBcRZCj9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nx4ID9nC;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6B9606A31C;
	Mon, 16 Nov 2026 08:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE6B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nx4ID9nC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794817929; x=1826353929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Oxgth3AmwsvDCZ0PPMMWStXKhRuGGRFGSdZPZKjlpDc=;
  b=nx4ID9nCNoH2ANSISn0iJXP9WQliQ1TJDjglB1GJXwpxK3TZAnvcjwcu
   4vgPqyD7FV0baSSCxB2bgn5X2Emk4hxKNquFZGJy3+4U57yKe+yTp5Ky7
   H7JYWckmEAfpC0ZBHuXruGOEGn9NgJkt0ytgh9WNELbpB3YJGlfwIlgmJ
   EWfqTyUEn3neQCwD3rb7RvN7dZHULXIfOa3JOHrxe+XVoQA+fqdxIVv40
   M7ruLQ0apvPi3YjYwHoJVaO8JB/yGyZQod0EGJEe12PwNvoeigXY0iuQ0
   czIIRqQ27AI31UuXH9w5UN02GN2Rey+RrtlFnThiM/YFbckubdTJXjLH9
   g==;
X-CSE-ConnectionGUID: S1wdVBe+R1WY2IPnabDWTw==
X-CSE-MsgGUID: mutc59IgT0GYZIx2ILBuyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3420446"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3420446"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:32:06 -0800
X-CSE-ConnectionGUID: 8jMWouKuTNKr4POp4yhemQ==
X-CSE-MsgGUID: 92679GxuTEKHrdwtS8+k/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9681522"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:31:58 -0800
Date: Mon, 16 Nov 2026 10:31:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	". Boqun Feng" <boqun@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: rant on Rust in kernel
Message-ID: <avq_fOVO4dina23a@ashevche-desk.local>
References: <avXdJyqNNqopuH2_@ashevche-desk.local>
 <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
 <avc-fQWSvmtHhtCO@ashevche-desk.local>
 <CANiq72=RbzZHgZEMfLkDRQx-_PoxEfgL_Ar8figchde5u5qc=Q@mail.gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=RbzZHgZEMfLkDRQx-_PoxEfgL_Ar8figchde5u5qc=Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 14, 2026 at 01:22:48PM +0100, Miguel Ojeda wrote:
> On Fri, Nov 13, 2026 at 5:44 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > Yes, indeed. Any idea what to do (see below)?
> >
> > Ah, it seems I was mistaken, the distro is Debian trixie which sounds like stable.
> > Unstable is on my desktop.
> 
> If you want to build with Rust enabled, then you need to either change
> LLVM or `bindgen` to fit the equation above.

For now I'm fine without Rust. With Rust I have only problem with the build
time (assuming the build errors are addressed by on of the solutions you
mentioned below).

> So, for instance, you could build with an older LLVM (e.g. LLVM 19 is
> the default one in Debian stable). If LLVM 22 is around you may need
> to use `LIBCLANG_PATH` to point to an older one.

You mean for the in-kernel builds or in general? If you are talking for
the former, this needs to be fixed as the version  we supply via LLVM make
parameter (as you can see in my command line examples). Another story if
this is broken on the clang level (but then how kernel is built?).

> Or, if you want to use LLVM 22, then you could install the `bindgen`
> from Debian testing or unstable (they have 0.72.1, which is new enough
> for LLVM 22, and checking in a Debian trixie container the build
> succeeds).

> Or you could build yourself a `bindgen` from scratch:
> 
>   cargo install --locked bindgen-cli
> 
> That is the easiest route, and takes just about a minute to build, but
> requires trusting something else than your distribution. If you do,
> you can use `make BINDGEN=...` to point to it, or you can just put it
> in your `$PATH`.
> 
> I hope that helps.

Right, thanks!

-- 
With Best Regards,
Andy Shevchenko


