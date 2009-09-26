Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f211.google.com ([209.85.219.211]:50008 "EHLO
	mail-ew0-f211.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752321AbZIZMNe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Sep 2009 08:13:34 -0400
Message-ID: <4ABE056F.6090005@tuffmail.co.uk>
Date: Sat, 26 Sep 2009 13:13:35 +0100
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] module: unexport each_symbol()
References: <1253626718-18887-1-git-send-email-alan-jenkins@tuffmail.co.uk> <1253626718-18887-4-git-send-email-alan-jenkins@tuffmail.co.uk> <alpine.DEB.1.10.0909231112490.15822@dr-wily.mit.edu> <20090923220022.GB30818@infradead.org>
In-Reply-To: <20090923220022.GB30818@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rusty@rustcorp.com.au
Cc: Tim Abbott <tabbott@ksplice.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-modules@vger.org, Christoph Hellwig <hch@infradead.org>

Christoph Hellwig wrote:
> On Wed, Sep 23, 2009 at 01:29:43PM -0400, Tim Abbott wrote:
>   
>> While Ksplice is not in-tree yet, Ksplice is a user of each_symbol (and in 
>> fact was the reason why each_symbol was originally exported).  Is it easy 
>> to modify your patch series so that you don't have to remove each_symbol?
>>     
>
> We don't keep symbols for out of tree junk around.
>   

We do alter them mercilessly though :-).

I don't want to preserve the current implementation of each_symbol()
because it duplicates too much of the modified find_symbol().  However,
the duplicated code can be simplified if I changed the various "syms"
fields in struct module with a single array (without increasing the size
of struct module).  I consider this a cleanup; it would benefit a couple
of other sites in module.c as well.

The change would make "struct symsearch" redundant - changing the
interface of each_symbol().  If Ksplice fails to merge quickly enough it
will still be easy to remove each_symbol(), and we'll still benefit from
the cleanup in find_symbol() and elsewhere.

Rusty, does that make sense to you?

Thanks
Alan
