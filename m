Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:59388 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751715Ab1G3XyB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 30 Jul 2011 19:54:01 -0400
Message-ID: <4E34998D.8060806@zytor.com>
Date: Sat, 30 Jul 2011 16:53:49 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Enable 'make CONFIG_FOO=y oldconfig'
References: <1312067499.22074.59.camel@i7.infradead.org> <1312067670.22074.61.camel@i7.infradead.org> <CACqU3MV460WGjmQdOOmhk3ZJT1FNjEjfuHqx8mYcgun9+7SfjA@mail.gmail.com>
In-Reply-To: <CACqU3MV460WGjmQdOOmhk3ZJT1FNjEjfuHqx8mYcgun9+7SfjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 07/30/2011 04:44 PM, Arnaud Lacombe wrote:
> 
> Beside that, the one thing I dislike with your patch is that it is
> unconditional and global to all symbols, and you have no way to forbid
> the environment to override a value.
> 

Why????

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

