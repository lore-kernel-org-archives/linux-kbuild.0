Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f211.google.com ([209.85.219.211]:51264 "EHLO
	mail-ew0-f211.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752462AbZIWSfh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2009 14:35:37 -0400
Message-ID: <4ABA6A90.4000501@tuffmail.co.uk>
Date: Wed, 23 Sep 2009 19:36:00 +0100
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] module: unexport each_symbol()
References: <1253626718-18887-1-git-send-email-alan-jenkins@tuffmail.co.uk> <1253626718-18887-4-git-send-email-alan-jenkins@tuffmail.co.uk> <alpine.DEB.1.10.0909231112490.15822@dr-wily.mit.edu>
In-Reply-To: <alpine.DEB.1.10.0909231112490.15822@dr-wily.mit.edu>
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tim Abbott <tabbott@ksplice.com>
Cc: rusty@rustcorp.com.au, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-modules@vger.org

Tim Abbott wrote:
> Hi Alan,
>
> I really like what you're doing with this patch series; using a binary 
> search for the symbol table has been something I've wanted to do in the 
> kernel's module loader ever since I optimized Ksplice's symbol resolution 
> code to use binary rather than linear searches.
>
> While Ksplice is not in-tree yet, Ksplice is a user of each_symbol (and in 
> fact was the reason why each_symbol was originally exported).  Is it easy 
> to modify your patch series so that you don't have to remove each_symbol?
>   

I'll have to think harder about it, but that's my problem. I should have 
checked the changelog :-).

Regards
Alan
