Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49835 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752374Ab3HPOCS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Aug 2013 10:02:18 -0400
Message-ID: <520E30E7.1020907@suse.cz>
Date: Fri, 16 Aug 2013 16:02:15 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] Gtk/Qt interface flavours ported to newest toolkit
 versions
References: <kconfig-port-gtk-qt> <1375612711-17140-1-git-send-email-david.graeff@web.de> <520E28F0.4080502@suse.cz> <201308161536.29721.yann.morin.1998@free.fr>
In-Reply-To: <201308161536.29721.yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: David Graeff <david.graeff@web.de>, linux-kbuild@vger.kernel.org, sam@ravnborg.org

On 16.8.2013 15:36, Yann E. MORIN wrote:
> Michal, David, All,
> 
> On Friday 16 August 2013 15:28:16 Michal Marek wrote:
>> On 4.8.2013 12:38, David Graeff wrote:
>>>   KConf: Move flavours into their own subdirectories.
>>>   KConf: Update/Port Gtk flavour to use Gtk3
>>>   KConf: Qt interface port to Qt4/Qt5, removed Qt3 Support
>>>   KConf: images.c for gtk/qt gui flavour reoganized
>>
>> I only received 1/4 and 4/4 through the mailing list. Perhaps vger
>> rejected the other two patches for size reasons? I know that Yann told
>> to to send full copies of patches instead of pull request, but could you
>> please create a repository on some git hosting site and publish the
>> patches there _in addition to_ sending them by mail?
> 
> Indeed, they are big patches.
> 
> I postponed getting them in my branch in waiting to get more reviews on
> these, since I'm not really comfortable with Qt/GTK.
> 
> I'll eventually get them, and if there are enough good reviews coming in
> before 3.12, I'll queue them for 3.12; otherwise, I was aiming for 3.13.

I think the first patch can be applied easily, provided David sends a
new version that addresses Sam's review. Regarding the actual port to
newer Gtk / Qt, I'd like to see the patches, too :).

Michal
