Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:47322 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751037AbYLCVf4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2008 16:35:56 -0500
Date: Wed, 3 Dec 2008 22:37:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 6/8] scripts: improve the decodecode script
Message-ID: <20081203213721.GG7599@uranus.ravnborg.org>
References: <200812012221.mB1ML68s013106@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812012221.mB1ML68s013106@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, arjan@linux.intel.com, wangcong@zeuux.org

On Mon, Dec 01, 2008 at 02:21:06PM -0800, akpm@linux-foundation.org wrote:
> From: Arjan van de Ven <arjan@linux.intel.com>
> 
> kerneloops.org has been using an improved "decodecode" script,
> specifically it has a special marker that shows which line in the assembly
> the oops happened at, like this:
> 
>   20:	83 e0 03             	and    $0x3,%eax
>   23:	09 d8                	or     %ebx,%eax
>   25:	85 db                	test   %ebx,%ebx
>   27:	89 02                	mov    %eax,(%edx)
>   29:	74 0f                	je     0x3a
>   2b:*	3b 73 04             	cmp    0x4(%ebx),%esi     <-- trapping instruction
>   2e:	75 05                	jne    0x35
>   30:	89 53 04             	mov    %edx,0x4(%ebx)
>   33:	eb 07                	jmp    0x3c
>   35:	89 53 08             	mov    %edx,0x8(%ebx)
> 
> this patch updates the kernel copy to also have this functionality.
> 
> Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>
> Reviewed-by: WANG Cong <wangcong@zeuux.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Applied.

	Sam
