Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D1189BB6;
	Thu, 26 Mar 2026 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538315; cv=none; b=a61HtTN2jtb1F94mKHcVVGqkC4M2b/VOMaogSfB1wVzhhvZsOjRfNP5T0O+EcWdzyZcbSvwZBqusr26qy0UrtYSgCZAHhxDjf9QAB4rQCfdEntJm6cI/6EICDQ6goVQoELayjLCX9u7eeGW0oTDo+ixgrQkWlGsb5YJ8Xx4a5+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538315; c=relaxed/simple;
	bh=zMEfNYyulbbBO+B2jw1pys/BiNnSCmKkoeacgTSe4EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8Bp97GPrAt73e1s5CLayDODXxPelCUusS6POdp3DtloMnCxa9kMAIq98oYVben11PaJ83W9CNXknojT6Eg8sS4pzPLwb31uzULCYMT9XehBtoudmpatNfz2ocqKWxkYj02Iqpsr7sHRHDoVAmgWAVO3UJL56Mn/7mV1XV9c54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=D26skTX5; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="D26skTX5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1vOiFYL2/2gauah1MO2J0SrthHCAYelycFB7wMm2FBc=; b=D26skTX5ljpAkNaHIlMIJtyMXA
	iuIGQ5XwwypR4BJdeLJLVDrC+G8tMEFZ5P4tqFmMjvoI6AOG6PIGOYJ85eGHPeAxV6gRfx+n68+yA
	Z6Dx/Y4Gh1bEmBoiL199z+7bIHDUJX8pt+YRZ3g5KB5wjXksBBQ7eBwENc+99IFKclwJ/lK53Pjir
	PcYACczVKeLDRVOEKCWwE4d6xmObv4geC0gR07wywRb3JWhj2yDBMxHaFvNVJJPEA+2cOalvqqiaA
	4k8w4+HXDBOVmRXqj/u7croVsR0r2ZAHcvW2tmFLlVzNz55dyKB4kAZ54aQDsDWoJgqZAgnfjOQ71
	P2yYBqiA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58812)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5mTM-000000004wB-0dxj;
	Thu, 26 Mar 2026 15:18:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5mTH-0000000077v-1ifh;
	Thu, 26 Mar 2026 15:18:07 +0000
Date: Thu, 26 Mar 2026 15:18:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org,
	acourbot@nvidia.com, akpm@linux-foundation.org,
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net,
	gary@garyguo.net, johannes@sipsolutions.net, justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-um@lists.infradead.org, llvm@lists.linux.dev,
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com,
	morbo@google.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev,
	nsc@kernel.org, peterz@infradead.org, richard@nod.at,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Message-ID: <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
 <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Mar 26, 2026 at 03:31:26PM +0100, Christian Schrefl wrote:
> Hi Miguel,
> 
> On 3/26/26 2:47 PM, Miguel Ojeda wrote:
> > On Thu, Mar 26, 2026 at 11:10 AM Alice Ryhl <aliceryhl@google.com> wrote:
> >>
> >> I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
> >> target. It should probably not be -linux target to avoid this? Probably
> >> it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
> >> CPU_32v7, so we should not need to consider the other variants.
> > 
> > I think Christian tried several targets back then and eventually
> > picked that one.
> > 
> > Christian: what was the reason to pick the `-linux-` one? e.g. was
> > there something you wanted to rely on that target spec that you
> > couldn't enable or disable via `rustc` flags or similar?
> 
> It should probably be fine to use armv7a-none-eabi. I've mostly used
> arm-unknown-linux-gnueabi

I'm not sure if this is still true, but I believe it used to be the case
that the -linux-gnueabi target has one behaviour for enums (fixed size)
whereas -none-eabi, the size of the type depends on the range of values
included in the enum.

Certianly, when Arm Ltd were proposing EABI, EABI had the latter
behaviour, and I think there were cases where Linux used "enum" in
its UAPI.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
