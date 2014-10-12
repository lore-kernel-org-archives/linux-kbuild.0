Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from orange.myspectrum.nl ([149.210.134.247]:59605 "EHLO
	orange.myspectrum.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751626AbaJLQVn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Oct 2014 12:21:43 -0400
Message-ID: <543AA8BF.7090809@myspectrum.nl>
Date: Sun, 12 Oct 2014 18:13:51 +0200
From: Jeroen Hofstee <jeroen@myspectrum.nl>
MIME-Version: 1.0
Subject: Re: [U-Boot] [PATCH resend] kconfig: Fix compiler warning in menu.c
References: <1413109527-10718-1-git-send-email-hdegoede@redhat.com>
In-Reply-To: <1413109527-10718-1-git-send-email-hdegoede@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>, u-boot@lists.denx.de
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hello Hans,

On 12-10-14 12:25, Hans de Goede wrote:
> Hi,
>
> This one seems to have fallen through the cracks.
>
> Regards,
>
> Hans
>
(for U-boot)

nope, you replace an innocent warning (_might_ be) with
bad code, without any comment it is just because gcc failed
to recognize it is fine. Nor did you respond to the suggestion
if it helps gcc to recognize that if the two booleans are merged
into a single one. [or even split it in an if () if ()]. With this patch
you prevent any serious warning in case the variable is actually
used but not initialized, which is even worse if you ask me.

Regards,
Jeroen


