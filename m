Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4D0B2511020000780002899F@vpn.id2.novell.com>
Date: Fri, 17 Dec 2010 07:53:37 +0000
From: "Jan Beulich" <JBeulich@novell.com>
Subject: Re: [PATCH] fix undesirable side effect of adding "visible"
	 menu attribute
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
 <20101216212614.GD21436@pobox.suse.cz>
 <AANLkTi=Va4upUfgX8+kSKMOaepSGy3AVTA9az4OecvY4@mail.gmail.com>
 <AANLkTim+63yNuMqUm5RkDXHHBw8mN-wo4=TsnJMjGBXL@mail.gmail.com>
In-Reply-To: <AANLkTim+63yNuMqUm5RkDXHHBw8mN-wo4=TsnJMjGBXL@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>, Michal Marek <mmarek@suse.cz>
Cc: mchehab@redhat.com, linux-kbuild@vger.kernel.org

>>> On 17.12.10 at 03:03, Arnaud Lacombe <lacombar@gmail.com> wrote:
> hum, I just thought of something. Instead of adding more complexity to
> the menu children, why would {,m,n,q}conf descend to these submenus at
> first. they should just ignore all the childs if the parent is not
> meant to be visible and go to the next node on the same level. When I
> close the front door of my house, I do expect people to stop right
> there, not continue to check any door I may have left open inside.

Isn't that what's happening? I don't think the problem is with the
frontends - it's the backend that writes out settings of options it
didn't before (and shouldn't).

Jan

