Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:53004 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758423Ab3ENWi0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 May 2013 18:38:26 -0400
Message-ID: <5192BCDA.4000401@zytor.com>
Date: Tue, 14 May 2013 15:38:18 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Subdirectory output dependencies
References: <5191C313.1010105@zytor.com>
In-Reply-To: <5191C313.1010105@zytor.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

On 05/13/2013 09:52 PM, H. Peter Anvin wrote:
> What is the proper way to indicate to Kbuild that something in the
> current directory depends on something built in a subdirectory?
> 
> Specifically, something like:
> 
> obj-y += foo/
> obj-y += bar.o
> 
> ... where bar.o depends on a header file generated inside the foo directory?
> 

Note: in the real-life example there is a lot of bar.o's:

https://git.kernel.org/cgit/libs/klibc/klibc.git/tree/usr/klibc/Kbuild

	-hpa

