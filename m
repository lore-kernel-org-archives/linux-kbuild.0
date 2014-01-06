Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:45639 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755092AbaAFVAF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jan 2014 16:00:05 -0500
Date: Mon, 6 Jan 2014 13:00:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: #pragma once?
Message-Id: <20140106130003.4eea0893605369a8fd9336ac@linux-foundation.org>
In-Reply-To: <20140106204706.GA16924@leaf>
References: <20140106204706.GA16924@leaf>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Rashika Kheria <rashika.kheria@gmail.com>

On Mon, 6 Jan 2014 12:47:07 -0800 Josh Triplett <josh@joshtriplett.org> wrote:

> Does anyone have any objection to the use of "#pragma once" instead of
> the usual #ifndef-#define-...-#endif include guard?

Sounds OK to me.  gcc has supported this for quite a long time, yes?  I
wonder if ICC supports it.

(I haven't heard anything of ICC-for-kernel in a long time - is it still
a living thing?)
