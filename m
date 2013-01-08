Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:49355 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756921Ab3AHS2D (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Jan 2013 13:28:03 -0500
Received: by mail-vc0-f175.google.com with SMTP id fy7so708207vcb.20
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Jan 2013 10:28:02 -0800 (PST)
MIME-Version: 1.0
From: Javier Domingo <javierdo1@gmail.com>
Date: Tue, 8 Jan 2013 19:27:42 +0100
Message-ID: <CALZVapkvKeSbDdQruumGM-8RyVOnoNGD2Lm=7gZ+tEMcbXvnjw@mail.gmail.com>
Subject: Readability of make menuconfig
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I have been using the kbuild system for 2 years now on. I am an IT
student, and I just wanted to say some impressions I get from the
actual system.

First of all, I must say its impressive the engineering work that has
been done to do such a good system.

Then I would like to say what I think it is lacking of (the curses
interface at least).

1.- Many times, althought you have the option to use sortcuts, they
are really not usable, just because there are lots of them that are
the same.

So if there was any way to search for patterns within the same page,
will be great.

2.- When you are looking for something, you search, and it tell you
where it is, but you will have to repeat the search if you didn't note
it down (if not too obvious) several times, the most of the times this
is the first thing a newbie suffers.

It would be great if appart from searching, you would put hiperlinks
or something to go to the entries.

3.- When you finally get to the page where you have to change the
macro, apart from the disadvantages in points 1 and 2, you have to
search all around the page because they are not ordered in any way
(but the programmer's have specified).

I can understand that some are parts of different Kconfigs, and others
are there because a dev dropped it there, but it is horrible to find
something in there.

That is why I would please ask for, althought respecting the tree
levels, sort the menus alphabetically.

4.- And last but not least, I would love to have menus in some sort of
sections/parts so that If I want to disable lapb protocol, I have a
section of link protocols, and if I want to enable debugging features,
I can go to a section inside the Kernel hacking menu (for example
debugging)

So a solution to this would be either do sections, or make maintainers
use a logical menu tree for clasifying the entries. The "section" I
propose is a little title on the head, like the one in Networking
support (1st line)

Hope you like this ideas and that some of them are really easier to do
than I think they are to,

Looking back for your response,

Javier Domingo
