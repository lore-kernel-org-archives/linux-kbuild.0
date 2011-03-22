Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:36788 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754593Ab1CVCwh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Mar 2011 22:52:37 -0400
Date: Mon, 21 Mar 2011 22:52:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: PATCH][RFC][resend] CC_OPTIMIZE_FOR_SIZE should default to N
Message-ID: <20110322025232.GL14675@home.goodmis.org>
References: <alpine.LNX.2.00.1103212105490.15815@swampdragon.chaosbits.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.1103212105490.15815@swampdragon.chaosbits.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jesper Juhl <jj@chaosbits.net>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Ingo Molnar <mingo@elte.hu>, Daniel Lezcano <daniel.lezcano@free.fr>, Eric Paris <eparis@redhat.com>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

On Mon, Mar 21, 2011 at 09:08:24PM +0100, Jesper Juhl wrote:
> I believe that the majority of systems we are built on want a -O2 compiled 
> kernel. Optimizing for size (-Os) is mainly benneficial for embedded 
> systems and systems with very small CPU caches (correct me if I'm wrong).
> So it seems wrong to me that CC_OPTIMIZE_FOR_SIZE defaults to 'y' and 
> recommends saying 'Y' if unsure. I believe it should default to 'n' and 
> recommend that if unsure. People who bennefit from -Os know who they are 
> and can enable the option if needed/wanted - the majority shouldn't 
> select this. Right?
> 
> Signed-off-by: Jesper Juhl <jj@chaosbits.net>

I've actually seen nothing but problems with -Os.

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

