Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F836308C;
	Mon, 23 Mar 2026 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252254; cv=none; b=PELFdb/rxlP0plGztGFEhDpmYJ4dIIRa5DZAugVp5qNyNpzS7jykBKZ7KRgPnOLV/6qOIwca2PvjhRTJ+dHn1T98PGIDKgzzkNNS592G3wQGWpJjKeMAwbA6drKrepDPI/hRDRwsmSYdzoiVTnEd4h4LQmKTnDA8XUdKpLfBWrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252254; c=relaxed/simple;
	bh=VwtSJIp8ENHMSX+xFEF3sWtn+Y2VJrcUVbX8lQmkP+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnxojVFRIiFrKL03YQI0WEhdlUdlJTEBoXg+mzot9D5MQ/bnBiTZRi5Dj52k73sGRNisQDy0HFyIGxd0RhsmFW1PJpdzM6kasvB4TBCKTKWlGFNfQDBO4+t1ui6qewlyCGQeuFsJbBbswlhyYaDp9TEZDlDYEAiSISkCzhv5I0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TGqMdeOM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TGqMdeOM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D31AC2BCB0;
	Mon, 23 Mar 2026 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774252254;
	bh=VwtSJIp8ENHMSX+xFEF3sWtn+Y2VJrcUVbX8lQmkP+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGqMdeOMBMS40jbvN3VCndGyHRmX53aBTL8cPWIJ9jdvYJeiJ8heg2vZp7U4d7WVn
	 1u/yLe04dbEr8J1T3VCKnJxf2AY7v5xpvA7cb7yvIjE6DAvM1Z7nWI+Dgc0bBgMU50
	 qqH+S53n8p4Fd+UNSqcYmYHe4qs/l16LoK7Zr2R8=
Date: Mon, 23 Mar 2026 08:50:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
	masahiroy@kernel.org, linux@weissschuh.net, tamird@kernel.org,
	rostedt@goodmis.org, ihor.solodrai@linux.dev, ritesh.list@gmail.com,
	maddy@linux.ibm.com, peterz@infradead.org
Subject: Re: [PATCH v2] char: nvram: Remove unused nvram_mutex to fix
 -Wunused-variable warning
Message-ID: <2026032305-cross-sensuous-8f4a@gregkh>
References: <20260323073220.25798-1-venkat88@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323073220.25798-1-venkat88@linux.ibm.com>

On Mon, Mar 23, 2026 at 01:02:20PM +0530, Venkat Rao Bagalkote wrote:
> v2:
>   - Added missing Suggested-by tag from Ritesh Harjani (IBM)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
